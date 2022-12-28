import { EntityRepository, getCustomRepository, Repository } from "typeorm";
import { TransactionEntity } from "../transaction.entity";
import { Request, Response } from "express";
import { UserRepository } from "./user.repository";


@EntityRepository(TransactionEntity)
export class TransactionRepo extends Repository<TransactionEntity>{

    async addTransaction(req: Request, res: Response) {
        let { transaction_receiver, user, transaction_title, transaction_amount } = req.body;
        let userRepo = getCustomRepository(UserRepository)
        let transactionEntity = new TransactionEntity()
        transactionEntity.user = user;
        transactionEntity.transaction_title = transaction_title;
        transactionEntity.transaction_amount = transaction_amount;
        transactionEntity.transaction_receiver = transaction_receiver;
        let recvUserExists = await userRepo.createQueryBuilder("users").select().where("users.username = :transaction_receiver", {
            transaction_receiver
        }).getCount() > 0;
        if (!recvUserExists) {
            return res.send({
                code: 403,
                auth: false,
                message: "User Does Not Exist!"
            })
        }
        var sec_bal = (await userRepo.createQueryBuilder("users").select().where("users.username = :user", { user }).getOne()).balance;
        var recvBal: any = (await userRepo.createQueryBuilder("users").select().where("users.username = :transaction_receiver", { transaction_receiver }).getOne()).balance;
        var senderNewBal: number = parseInt(sec_bal) - parseInt(transaction_amount);
        var recvNewBal: number = parseInt(recvBal) + parseInt(transaction_amount);
        if (sec_bal <= transaction_amount) {
            return res.send({
                code: 410,
                auth: false,
                message: "Not Enough Rbux!"
            })
        }
        await this.save(transactionEntity).then(async (data: any) => {
            await userRepo.update({ username: user }, { balance: senderNewBal.toString() });
            await userRepo.update({ username: transaction_receiver }, { balance: recvNewBal.toString() });

            if (data !== undefined) {
                return res.send({
                    code: 201,
                    added: true,
                    message: "Transaction completed!"
                })
            }
        }).catch((error: any) => {
            if (error !== undefined) {
                return res.send({
                    code: 401,
                    added: false,
                    message: error
                })

            }
        })
    }

    async fetchTransactionHistory(req: Request, res: Response) {
        try {
            var { user } = req.body;
            let transaction = await this.createQueryBuilder("transaction").select().where("transaction.user =:user", { user }).orWhere("transaction.transaction_receiver = :user", { user }).getMany();
            var result = []
            for (var i = 0; i < transaction.length; i++) {
                if (transaction[i].held_by_owner == false) {
                    if (transaction[i].user != user) {
                        result.push(transaction[i])
                    }
                }
                else { result.push(transaction[i]) }
            }
            if (transaction != undefined) {
                return res.send({
                    code: 200,
                    data: result,
                    received: true
                })
            }
        } catch (err) {
            if (err !== undefined) {
                return res.send({
                    code: 401,
                    data: "No Transaction History",
                    received: false
                })
            }
        }
    }
    async clearTransactionHistory(req: Request, res: Response) {
        var { user } = req.body;
        await this.createQueryBuilder("transaction").update({ "held_by_owner": false }).where("transaction.user =:user", { user }).andWhere("transaction.held_by_owner = true").execute();
        return res.send({
            "code": 200,
            "data": "Transaction History Cleared!"
        })
    }

    async deleteSingleTransaction(req: Request, res: Response) {
        var { transaction_id } = req.body;
        var deleted = await this.createQueryBuilder("transaction").select().where("transaction.transaction_id = :transaction_id", { transaction_id }).getOne()
        await this.createQueryBuilder("transaction").update({ "held_by_owner": false }).where("transaction.transaction_id = :transaction_id", { transaction_id }).execute();
        return res.send({
            "code": 200,
            "data": deleted
        })
    }
}
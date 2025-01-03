import { BaseEntity, Entity, EntityRepository, getCustomRepository, Repository, TransactionRepository } from "typeorm";
import { TransactionEntity } from "../transaction.entity";
import { Request, Response } from "express";
import { runInThisContext } from "vm";
import { UserRepository } from "./user.repository";
import { getConnection } from "typeorm";
import { transactionrouter } from "../../../routes/post.routes";
import { UserEntity } from "../user.entity";
import { parse } from "path/posix";

@EntityRepository(TransactionEntity)
export class TransactionRepo extends Repository<TransactionEntity>{







    async addTransaction(req: Request, res: Response) {
        let { transaction_id, sec_bal, transaction_reciever, user, transaction_title, transaction_message, transaction_amount } = req.body;
        
        
        let userRepo = getCustomRepository(UserRepository)
        let transactionRepo = getCustomRepository(TransactionRepo)

        let transactionEntity = new TransactionEntity()
        let userEntity = new UserEntity();
        transactionEntity.user = user!;
        transactionEntity.transaction_title = transaction_title;
        transactionEntity.transaction_message = transaction_message;
        transactionEntity.transaction_amount = transaction_amount;
        transactionEntity.transaction_reciever = transaction_reciever;
        transactionEntity.transaction_id = transaction_id;
        let recvUserExists = await userRepo.createQueryBuilder("users").select().where("users.username = :transaction_reciever", {
            transaction_reciever
        }).getCount() > 0;
        if (!recvUserExists) {
            return res.send({
                code: 403,
                auth: false,
                message: "User Does Not Exist!"
            })
        }
        sec_bal = (await userRepo.createQueryBuilder("users").select().where("users.username = :user", { user }).getOne()).balance;
        var recvBal : any = (await userRepo.createQueryBuilder("users").select().where("users.username = :transaction_reciever", { transaction_reciever }).getOne()).balance;
        var senderNewBal :number = parseInt(sec_bal) - parseInt(transaction_amount);
        var recvNewBal : number = parseInt(recvBal) + parseInt(transaction_amount);
        if(sec_bal <= transaction_amount){
            return res.send({
                code: 410,
                auth: false,
                message: "Not Enough Rbux!"
            })
        }
        await this.save(transactionEntity).then(async (data: any) => {
            console.log(transaction_message + "<== transaction message");
            await userRepo.update({ username: user}, {balance: senderNewBal.toString()});
            await userRepo.update({ username: transaction_reciever}, {balance: recvNewBal.toString()});
            
            if (data !== undefined) {
                return res.send({
                    code: 201,
                    added: true,
                    message: "Transaction Added!"
                })
            }
        }).catch((error: any) => {
            if (error !== undefined) {
                console.log(error);
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
            var user2 = req.path;
            var user = user2.substring(1);
            let transaction = await this.createQueryBuilder("transaction").leftJoinAndSelect("transaction.transaction_user", "users").getMany();
            if (transaction !== undefined) {
                return res.send({
                    code: 200,
                    data: transaction,
                    received: true
                })
            }

        } catch (err) {

            if (err !== undefined) {
                return res.send({
                    code: 401,
                    data: null,
                    received: false
                })



            }


        }
    }



}
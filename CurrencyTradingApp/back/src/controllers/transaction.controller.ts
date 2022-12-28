import { Request, Response } from "express";
import { getCustomRepository, TransactionRepository } from "typeorm";
import { TransactionRepo } from "../database/entity/repository/transaction.repo";
import { transactionrouter } from "../routes/transaction.routes";
export class TransactionController {
    static async addTransaction(req: Request, res: Response) {
        let transactionRepo = getCustomRepository(TransactionRepo);
        await transactionRepo.addTransaction(req, res);

    }
    static async fetchTransactionHistory(req: Request, res: Response) {
        let transactionRepo = getCustomRepository(TransactionRepo);
        await transactionRepo.fetchTransactionHistory(req, res);

    }

    static async clearTransactionHistory(req: Request, res: Response) {
        let transactionRepo = getCustomRepository(TransactionRepo);
        await transactionRepo.clearTransactionHistory(req, res);
    }

    static async deleteSingleTransaction(req: Request, res: Response) {
        let transactionRepo = getCustomRepository(TransactionRepo);
        await transactionRepo.deleteSingleTransaction(req, res);
    }
}
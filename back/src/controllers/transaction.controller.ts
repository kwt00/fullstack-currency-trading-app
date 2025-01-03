import {Request, Response} from "express";
import { getCustomRepository, TransactionRepository } from "typeorm";
import { TransactionRepo } from "../database/entity/repository/transaction.repo";
import { transactionrouter } from "../routes/post.routes";
export class TransactionController{
    static async addTransaction(req: Request, res: Response){
        let transactionRepo = getCustomRepository(TransactionRepo);
        await transactionRepo.addTransaction(req, res);
    
    }
    static async fetchTransactionHistory(req: Request, res: Response){
        let transactionRepo = getCustomRepository(TransactionRepo);
        await transactionRepo.fetchTransactionHistory(req, res);
    
    }


}
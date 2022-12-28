import Router from "express";
import { Transaction } from "typeorm";
import { AuthController } from "../controllers/auth.controller";
import { TransactionController } from "../controllers/transaction.controller";

const transactionrouter = Router();

transactionrouter.post("/", TransactionController.fetchTransactionHistory);


transactionrouter.post("/add/", TransactionController.addTransaction);

transactionrouter.post("/clear/", TransactionController.clearTransactionHistory);

transactionrouter.post("/single/", TransactionController.deleteSingleTransaction);

export { transactionrouter };
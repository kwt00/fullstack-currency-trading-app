import Router from "express";
import { Transaction } from "typeorm";
import { AuthController } from "../controllers/auth.controller";
import { TransactionController } from "../controllers/transaction.controller";

const transactionrouter = Router();

transactionrouter.get("/:username", TransactionController.fetchTransactionHistory);


transactionrouter.post("/add/:username", TransactionController.addTransaction);

export { transactionrouter };
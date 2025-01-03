import Router from "express";
import { AuthController } from "../controllers/auth.controller";

const authrouter = Router();
authrouter.post("/decodejwt", AuthController.decodeJWT);
authrouter.post("/signup", AuthController.createNewAccount);
authrouter.post("/login", AuthController.login);
authrouter.get("/:user", AuthController.getUserBalance);

export { authrouter }
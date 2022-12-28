import Router from "express";
import { AuthController } from "../controllers/auth.controller";

const authrouter = Router();
authrouter.post("/decodejwt", AuthController.decodeJWT);
authrouter.post("/signup", AuthController.signup);
authrouter.post("/login", AuthController.login);
authrouter.post("/balance", AuthController.getUserBalance);

export { authrouter }
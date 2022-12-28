import { EntityRepository, IsNull, Repository } from "typeorm";
import { UserEntity } from "../user.entity";
import { Request, Response } from "express";
import jwt from "jsonwebtoken";
import { AuthController } from "../../../controllers/auth.controller";
import { CLOSING } from "ws";

@EntityRepository(UserEntity)

export class UserRepository extends Repository<UserEntity> {

    async decodeJWT(req: Request, res: Response) {
        let token = req.headers.authorization;
        let jwt_enc_key = process.env.JWT_ENC_KEY as string;
        jwt.verify(token, jwt_enc_key, async (error: any, data: any) => {
            if (error) {
                return res.send({
                    code: 403,
                    message: null
                })
            }
            else {
                var username = data.username;
                return res.send({
                    code: 200,
                    message: username
                })
            }
        });

    }

    async login(req: Request, res: Response) {
        let { username, userpassword } = req.body;
        let jwt_enc_key = process.env.JWT_ENC_KEY as string;
        let userdata: any | undefined = await this.findUserPassword(req, res, username)
        if (userdata == undefined) return res.send({
            code: 403,//Invalid Request
            message: "User Not Found",
            auth: false
        })
        let basePassword = userdata!.userpassword;
        try {
            var userpasswordWeird = AuthController.SHA2561(userpassword);
            var coolerpassword = AuthController.SHA2562(userpasswordWeird);
        }
        catch {
            return res.send({
                code: 401,//General Error
                message: "Something Went Wrong, Please Try Again",
                auth: false
            })
        }
        if (coolerpassword == basePassword) {
            jwt.sign(
                {
                    username
                },
                jwt_enc_key,
                {
                    expiresIn: "10000000000h"
                },
                async (error: any, data: any) => {
                    if (error) {
                        return res.send({
                            code: 401,//General Error
                            message: "Something Went Wrong. Please Try Again",
                            auth: false
                        });
                    }
                    return res.send({
                        code: 201,
                        message: data,
                        auth: true
                    });
                }
            );
        }
        else {
            return res.send({
                code: 407,//Wrong Password
                message: "Wrong Password",
                auth: false
            });
        }
    }

    async signup(req: Request, res: Response) {
        let { username, userpassword } = req.body;
        let jwt_enc_key = process.env.JWT_ENC_KEY as string;


        try {
            var userpasswordButWeird: any = AuthController.SHA2561(userpassword);
            var coolpassword = AuthController.SHA2562(userpasswordButWeird)
        }
        catch (error) {
            return res.send({
                code: 401,//General Error
                message: "Something Went Wrong, Please Try Again",
                auth: false
            })
        }

        await this.saveUserData(req, res, coolpassword);
        jwt.sign(
            {
                username
            },
            jwt_enc_key,
            {
                expiresIn: "1h"
            },
            async (error: any, data: any) => {
                if (error) {
                    return res.send({
                        code: 401,//General Error
                        message: error,
                        auth: false
                    });
                }
                return res.send({
                    code: 201,
                    message: data,
                    auth: true
                });
            }
        );

    }

    async saveUserData(req: Request, res: Response, hashedPassword: any) {
        let { username } = req.body;
        let userExists = await this.createQueryBuilder("users").select().where("users.username = :username", {
            username
        }).getCount() > 0;


        if (userExists) {
            return res.send({
                code: 403,//Invalid Request
                auth: false,
                message: "User already exists!"
            })
        }

        this.createQueryBuilder("users").insert().values({
            username,
            userpassword: hashedPassword
        }).execute();
    }

    async findUserPassword(req: Request, res: Response, username: string): Promise<any> {
        let baseUserPassword = this.createQueryBuilder("users").select("users.userpassword").where("users.username = :username", { username }).getOne();
        return baseUserPassword
    }



    async getUserBalance(req: Request, res: Response) {
        try {
            var { username } = req.body;
            var recvBal = await this.createQueryBuilder("users").select().where("users.username = :username", { username }).getOne();
            return res.send({
                code: 200,
                data: recvBal.balance,
                received: true
            })
        }
        catch (e) {
        }

    }


}
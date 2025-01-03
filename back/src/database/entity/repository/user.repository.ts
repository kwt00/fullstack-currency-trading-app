import { EntityRepository, IsNull, Repository } from "typeorm";
import { UserEntity } from "../user.entity";
import {Request, Response} from "express";

@EntityRepository(UserEntity)

export class UserRepository extends Repository<UserEntity> {

    async saveUserData(req : Request, res : Response, hashedPassword : any){
        let {username} = req.body;
        let userExists = await this.createQueryBuilder("users").select().where("users.username = :username", {
            username
        }).getCount() > 0;
    

    if(userExists){
        return res.send({
            code: 403,//Invalid Request
            auth : false,
            message : "User already exists!"
        })
    }

    this.createQueryBuilder("users").insert().values({
        username,
        userpassword : hashedPassword
    }).execute();
    console.log('done')
    }

    async findUserPassword(req: Request, res: Response, username : string) : Promise<any>{
        let baseUserPassword = this.createQueryBuilder("users").select("users.userpassword").where("users.username = :username", {username}).getOne();
        return baseUserPassword
    }



    async getUserBalance(req: Request, res: Response, user : string) {
            try{var recvBal = await this.createQueryBuilder("users").select().where("users.username = :user", { user }).getOne();
            // var balance = recvBal.balance;
            // console.log(user + "\'s balance is " + balance);
            return res.send({
                code: 200,
                data: recvBal.balance,
                received: true
            })}
            catch(e){
                console.log("err");
                console.log(e);
                return;
            }
        
    }


}
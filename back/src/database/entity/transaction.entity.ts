import { Column, Entity, ManyToOne, PrimaryColumn, PrimaryGeneratedColumn } from "typeorm";
import { UserEntity } from "./user.entity";

@Entity("transaction")
export class TransactionEntity{

    
    @PrimaryGeneratedColumn()
    transaction_id: string;

    @Column({
        nullable: false
    })    
    user!: string;
    @Column({
        nullable: false
    })
    transaction_title!: string;
    @Column({
        nullable: false,
        default: " "
    })
    @Column({
        default: "100",
        type: String
    })
    sec_bal: String;
    transaction_message!: string;
    @Column({
        nullable: false,
        type: "timestamp",
        default: ()=> "CURRENT_TIMESTAMP(6)"
    })
    transaction_time: Date;
    @Column({
        nullable: false
    })
    transaction_amount: number;
    @Column({
        nullable: false
    })
    transaction_reciever!: string;
    @ManyToOne(() => UserEntity, (transaction_user) => transaction_user.user_transaction)
    transaction_user!: UserEntity;

}
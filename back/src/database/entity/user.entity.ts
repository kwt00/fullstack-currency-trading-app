import { BaseEntity, Column, Entity, JoinColumn, OneToMany, PrimaryColumn, PrimaryGeneratedColumn } from "typeorm";
import { TransactionEntity } from "./transaction.entity";

@Entity("users")
export class UserEntity extends BaseEntity{

    @PrimaryGeneratedColumn()
    id! : string;
    @Column({
        nullable : false
    })
    username! : string;
    @Column({
        nullable: false,
        default: "100"
    })
    balance!: string;
    // @Column({
    //     default: 100,
    //     type: Number
    // })
    // sec_bal: number;
    @Column({
        nullable : false
    })
    userpassword! : string;

    //Relations

    @OneToMany(() => TransactionEntity, (user_transaction) => user_transaction.transaction_user)
    @JoinColumn()
    user_transaction!: TransactionEntity[];
}
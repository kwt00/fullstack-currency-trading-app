import { Column, Entity, Long, ManyToOne, PrimaryColumn, PrimaryGeneratedColumn } from "typeorm";
import { UserEntity } from "./user.entity";

@Entity("transaction")
export class TransactionEntity {


    @PrimaryGeneratedColumn()
    transaction_id: number;

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
    @Column({
        nullable: false,
        type: "timestamp",
        default: () => "CURRENT_TIMESTAMP(6)"
    })
    transaction_time: Date;
    @Column({
        nullable: false
    })
    transaction_amount: number;
    @Column({
        nullable: false
    })
    transaction_receiver!: string;
    @Column({
        default: true
    })
    held_by_owner!: Boolean

}
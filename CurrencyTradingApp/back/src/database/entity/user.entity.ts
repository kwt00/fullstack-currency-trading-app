import { BaseEntity, Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity("users")
export class UserEntity extends BaseEntity {
    @PrimaryGeneratedColumn()
    id!: string;
    @Column({
        nullable: false
    })
    username!: string;
    @Column({
        nullable: false,
        default: "100"
    })
    balance!: string;
    @Column({
        nullable: false
    })
    userpassword!: string;
}
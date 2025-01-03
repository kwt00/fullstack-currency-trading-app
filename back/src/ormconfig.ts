import { join } from "path";
import { ConnectionOptions } from "typeorm";
import { TransactionRepo } from "./database/entity/repository/transaction.repo";
import { TransactionEntity } from "./database/entity/transaction.entity";
import { UserEntity } from "./database/entity/user.entity"; 

const connectionOptions : ConnectionOptions = {
    type: "postgres",
    host: "localhost",
    port: 5434,
    username: "postgres",
    password: "hIJACK123",
    database: "rbux",
    entities: [UserEntity, TransactionEntity],
    synchronize: true,
    dropSchema: false,
    migrationsRun: true,
    logging: false,
    logger: "debug",
    migrations: [join(__dirname, "src/migration/**/*.ts")],
};

export = connectionOptions;
import express from "express"
import { authrouter } from "./routes/authentication.routes";
import config from "./ormconfig";
import { createConnection, ConnectionOptions, Connection } from "typeorm";
import "reflect-metadata";
import { appendFile } from "fs";
import { transactionrouter } from "./routes/post.routes";
const rbux = express();
const port = process.env.PORT || 8000;
const bp = require('body-parser')


createConnection(config as ConnectionOptions).then((connection) =>{
    if(connection.isConnected){
        console.log('Postgres connected');
    }
    rbux.set("port", port);
    rbux.use(express.json());
    rbux.use(express.urlencoded({
        extended : false
    }));
    rbux.use(bp.json())
rbux.use(bp.urlencoded({ extended: true }))
    rbux.use("/user",authrouter);
    rbux.use("/transaction", transactionrouter);
    rbux.listen(rbux.get("port"), () => {
    console.log(`RbuX backend online on ${rbux.get("port")}`);
});
});
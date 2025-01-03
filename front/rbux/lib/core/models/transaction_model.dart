// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
    Post(
        this.code,
        this.data,
        this.received,
    );

    int code;
    List<Datum> data;
    bool received;

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        json["code"],
        List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        json["received"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "received": received,
    };
}

class Datum {
    Datum(
        this.transactionId,
        this.user,
        this.transactionTitle,
        this.transactionTime,
        this.transactionAmount,
        this.transactionReciever,
    );

    int transactionId;
    String user;
    String transactionTitle;
    DateTime transactionTime;
    int transactionAmount;
    String transactionReciever;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        json["transaction_id"],
        json["user"],
        json["transaction_title"],
        DateTime.parse(json["transaction_time"]),
        json["transaction_amount"],
        json["transaction_reciever"],
    );

    Map<String, dynamic> toJson() => {
        "transaction_id": transactionId,
        "user": user,
        "transaction_title": transactionTitle,
        "transaction_time": transactionTime.toIso8601String(),
        "transaction_amount": transactionAmount,
        "transaction_reciever": transactionReciever,
    };
}

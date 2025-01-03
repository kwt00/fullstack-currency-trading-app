// To parse this JSON data, do
//
//     final bal = balFromJson(jsonString);

import 'dart:convert';

Bal balFromJson(String str) => Bal.fromJson(json.decode(str));

String balToJson(Bal data) => json.encode(data.toJson());

class Bal {
    Bal(
        this.code,
        this.data,
        this.received,
    );

    int code;
    String data;
    bool received;

    factory Bal.fromJson(Map<String, dynamic> json) => Bal(
        json["code"],
        json["data"],
        json["received"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "data": data,
        "received": received,
    };
}

// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import "package:http/http.dart" as http;
import 'package:provider/provider.dart';
import 'package:rbux/core/notif/auth.notif.dart';
import 'package:rbux/globals.dart';
import 'package:rbux/rbux/routes/api.routes.dart';

class TransactionAPI {
  final client = http.Client();
  final headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Access-Control-Allow-Origin': "*"
  };
  Future addTransaction(
      {required String transaction_reciever,
      required String user,
      required num transaction_amount,
      required String transaction_message,
      required String transaction_title}) async {
    String subUrl = "/transaction/add/" + user;
    final Uri uri = Uri.parse(APIRoutes.baseURL + subUrl);
    try {
      final http.Response response = await client.post(uri,
          body: jsonEncode({
            "transaction_reciever": transaction_reciever,
            "user": user,
            "transaction_amount": transaction_amount,
            "transaction_message": transaction_message,
            "transaction_title": transaction_title,
          }),
          headers: headers);
      final statusCode = response.statusCode;
      final body = response.body;
      if (statusCode == 200) {
        print("vicroy here");
        return body;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future fetchTransactionHistory({required String user}) async {
    String subUrl = "/transaction/" + userVar;
    final Uri uri = Uri.parse(APIRoutes.baseURL + subUrl);
    try {
      final http.Response response = await client.get(uri, headers: headers);
      final statusCode = response.statusCode;
      final body = response.body;
      print(body);
      if (statusCode == 200) {
        return body;
      } else {
        print("HOLY WAKEr");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

// Future viewActiveTransactions

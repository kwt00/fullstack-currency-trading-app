// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import "package:http/http.dart" as http;
import 'package:provider/provider.dart';
import 'package:rbux/core/notif/auth.notif.dart';
import 'package:rbux/core/services/cache.service.dart';
import 'package:rbux/globals.dart';
import 'package:rbux/rbux/routes/api.routes.dart';

class TransactionAPI {
  final CacheService cacheService = new CacheService();
  final client = http.Client();
  final headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Access-Control-Allow-Origin': "*"
  };
  Future addTransaction(
      {required String transaction_receiver,
      required num transaction_amount,
      required String transaction_title}) async {
    String subUrl = "/transaction/add/";
    final Uri uri = Uri.parse(APIRoutes.baseURL + subUrl);
    try {
      final http.Response response = await client.post(uri,
          body: jsonEncode({
            "transaction_receiver": transaction_receiver,
            "user": username,
            "transaction_amount": transaction_amount,
            "transaction_title": transaction_title,
          }),
          headers: headers);
      final statusCode = response.statusCode;
      final body = response.body;
      if (statusCode == 200) {
        return body;
      }
    } catch (e) {}
  }

  Future fetchTransactionHistory() async {
    String subUrl = "/transaction/";
    final Uri uri = Uri.parse(APIRoutes.baseURL + subUrl);
    try {
      final http.Response response = await client.post(uri,
          body: jsonEncode({"user": username}), headers: headers);
      final statusCode = response.statusCode;
      final body = response.body;
      if (statusCode == 200) {
        return body;
      } else {}
    } catch (e) {}
  }

  Future clearTransactionHistory() async {
    String subUrl = "/transaction/clear/";
    final Uri uri = Uri.parse(APIRoutes.baseURL + subUrl);
    try {
      final http.Response response = await client.post(uri,
          body: jsonEncode(
              {"user": await cacheService.readCache(Key: "username")}),
          headers: headers);
      final statusCode = response.statusCode;
      final body = response.body;
      if (statusCode == 200) {
        return body;
      }
    } catch (e) {}
  }

  Future deleteSingleTransaction({required String transaction_id}) async {
    String subUrl = "/transaction/clear/";
    final Uri uri = Uri.parse(APIRoutes.baseURL + subUrl);
    try {
      final http.Response response = await client.post(uri,
          body: jsonEncode({
            "user": await cacheService.readCache(Key: "username"),
            "transaction_id": transaction_id
          }),
          headers: headers);
      final statusCode = response.statusCode;
      final body = response.body;
      if (statusCode == 200) {
        return body;
      }
    } catch (e) {}
  }
}

import 'dart:convert';
import 'dart:io';
import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:rbux/core/api/transact.api.dart';
import 'package:rbux/core/notif/auth.notif.dart';
import 'package:rbux/core/services/cache.service.dart';
import 'package:rbux/core/views/home.dart';
import 'package:rbux/globals.dart';
import 'package:rbux/rbux/routes/app.routes.dart';

class TransactionNotif extends ChangeNotifier {
  final CacheService cacheService = CacheService();
  Future fetchTransactionHistory({required BuildContext context}) async {
    try {
      final TransactionAPI _transactionAPI = TransactionAPI();
      var response = await _transactionAPI.fetchTransactionHistory();
      final Map<String, dynamic> parsedValue = await json.decode(response);
      transaction_history = parsedValue["data"];
    } catch (e) {}
  }

  Future clearTransactionHistory({required BuildContext context}) async {
    try {
      final TransactionAPI _transactionAPI = TransactionAPI();
      var response = await _transactionAPI.clearTransactionHistory();
      final Map<String, dynamic> parsedValue = await json.decode(response);
      await cacheService.deleteCache(Key: "transactions");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(parsedValue["data"])));
    } catch (e) {}
  }

  Future deleteSingleTransaction(
      {required String transaction_id, required BuildContext context}) async {
    try {
      final TransactionAPI _transactionAPI = TransactionAPI();
      var response = await _transactionAPI.deleteSingleTransaction(
          transaction_id: transaction_id);
      final Map<String, dynamic> parsedValue = await json.decode(response);
      transaction_history.remove(parsedValue["data"]);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Transaction deleted!")));
    } catch (e) {}
  }

  Future addTransaction(
      {required String transaction_receiver,
      required num transaction_amount,
      required String transaction_title,
      required BuildContext context}) async {
    try {
      final TransactionAPI _transactionAPI = TransactionAPI();
      final CacheService cacheService = CacheService();
      var response = await _transactionAPI.addTransaction(
          transaction_receiver: transaction_receiver,
          transaction_amount: transaction_amount,
          transaction_title: transaction_title);
      final Map<String, dynamic> parsedValue = await json.decode(response);
      final userJWT = parsedValue['message'];
      final userCode = parsedValue['code'];
      if (userCode == 201) {
        await fetchTransactionHistory(context: context);
        await cacheService.writeCache(Key: "jwt", Value: userJWT);
        await GetIt.I<AuthNotif>().getUserBalance();
        Navigator.pushNamed(context, homeRoute);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Transaction Added!")));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(userJWT)));
      }
    } catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Something Went Wrong")));
    }
  }
}

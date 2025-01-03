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
import 'package:rbux/core/models/transaction_model.dart';
import 'package:rbux/core/notif/auth.notif.dart';
import 'package:rbux/core/services/cache.service.dart';
import 'package:rbux/core/views/flutter_flow/flutter_flow_util.dart';
import 'package:rbux/core/views/home.dart';
import 'package:rbux/globals.dart';
import 'package:rbux/rbux/routes/app.routes.dart';

class TransactionNotif extends ChangeNotifier {
  final TransactionAPI _transactionAPI = new TransactionAPI();
  final CacheService cacheService = new CacheService();
  File? _selectedPostImage;
  File? get selectedPostImage => _selectedPostImage;
  String? _uploadedImgURL;
  String? get uploadedImgURL => _uploadedImgURL;
  Future fetchTransactionHistory(
      {required BuildContext context, required String user}) async {
    try {
      print("YOYOYO");
      var response =
          await _transactionAPI.fetchTransactionHistory(user: userVar);
      var modelledData = Post.fromJson(jsonDecode(response));
      var postCode = modelledData.code;
      var postData = modelledData.data;
      // print(postCode.toString() + "<= postcode");
      var isPostRecv = modelledData.received;
      if (isPostRecv) {
        switch (postCode) {
          case 200:
            {
              return postData;
            }
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future viewActiveTransactions(BuildContext context,
      {required String user}) async {
    try {
      var response =
          await _transactionAPI.fetchTransactionHistory(user: userVar);
      var modelledData = Post.fromJson(jsonDecode(response));
      var postCode = modelledData.code;
      var postData = modelledData.data;
      // print(postCode.toString() + "<= postcode");
      var isPostRecv = modelledData.received;
      if (isPostRecv) {
        switch (postCode) {
          case 200:
            {
              return postData;
            }
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future addTransaction(
      {
      // ignore: non_constant_identifier_names
      required String user,
      required String transaction_reciever,
      required num transaction_amount,
      required String transaction_message,
      required String transaction_title,
      required BuildContext context}) async {
    try {
      final authNotif = Provider.of<AuthNotif>(context, listen: false);
      var userEmail = await authNotif.fetchUsername();
      var response = await _transactionAPI.addTransaction(
          user: user,
          transaction_reciever: transaction_reciever,
          transaction_amount: transaction_amount,
          transaction_message: transaction_message,
          transaction_title: transaction_title);
      final Map<String, dynamic> parsedValue = await json.decode(response);
      final userJWT = parsedValue['message'];
      final userCode = parsedValue['code'];
      print(userCode);
      if (userCode == 201) {
        cacheService.writeCache(Key: "jwt", Value: userJWT);
        // Navigator.of(context).pushNamed(homeRoute);
        // Navigator.pushNamed(context, homeRoute);
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
      print(error);
    }
  }
}

import 'dart:convert';
import 'dart:core';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:rbux/core/api/auth.api.dart';
import 'package:rbux/core/api/transact.api.dart';
import 'package:rbux/core/notif/transaction_notif.dart';
import 'package:rbux/core/services/cache.service.dart';
import 'package:rbux/core/views/home.dart';
import 'package:rbux/globals.dart';

class AuthNotif extends ChangeNotifier {
  final CacheService cacheService = new CacheService();

  load(userJWT, username, context) async {
    await cacheService.writeCache(Key: "jwt", Value: userJWT);
    await cacheService.writeCache(Key: "username", Value: username);
    await cacheService.writeCache(
        Key: "balance", Value: (await getUserBalance()).toString());
    await GetIt.I<AuthNotif>().getUserBalance();
    await GetIt.I<TransactionNotif>().fetchTransactionHistory(context: context);
  }

  Future signup(
      {required BuildContext context,
      required String name,
      required String password,
      String? userimage}) async {
    try {
      var _authAPI = GetIt.I.get<AuthAPI>();
      var userData =
          await _authAPI.signUp(username: name, userpassword: password);
      final Map<String, dynamic> parsedValue = await json.decode(userData);
      final userJWT = parsedValue['message'];
      final userCode = parsedValue['code'];
      if (userCode == 201) {
        await load(userJWT, name, context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomepageWidget()));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(userJWT)));
      }
    } catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Something Went Wrong")));
    }
  }

  Future decodeJWT({required dynamic token}) async {
    try {
      var _authAPI = GetIt.I.get<AuthAPI>();
      var response = GetIt.I<AuthAPI>().decodeJWT(token: token);
      return response;
    } catch (e) {}
  }

  Future login(
      {required BuildContext context,
      required String username,
      required String password}) async {
    try {
      if (username == "" || password == '') {
        return ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Please fill in all of the fields!")));
        ;
      }
      var _authAPI = GetIt.I.get<AuthAPI>();
      var userData =
          await _authAPI.login(username: username, password: password);
      final Map<String, dynamic> parsedValue = await json.decode(userData);
      final userJWT = parsedValue['message'];
      final userCode = parsedValue['code'];
      if (userCode == 201) {
        await load(userJWT, username, context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomepageWidget()));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(userJWT)));
      }
    } catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Something Went Wrong")));
    }
  }

  getUserBalance() async {
    try {
      var response = await GetIt.I<AuthAPI>().getUserBalance();
      Map<String, dynamic> modelledData = await jsonDecode(response);
      await cacheService.writeCache(
          Key: "balance", Value: await modelledData["data"]);
      return await modelledData["data"];
    } catch (e) {}
  }
}

// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:rbux/core/api/auth.api.dart';
import 'package:rbux/core/api/transact.api.dart';
import 'package:rbux/core/models/bal_model.dart';
import 'package:rbux/core/models/transaction_model.dart';
import 'package:rbux/core/services/cache.service.dart';
import 'package:rbux/core/views/home.dart';
import 'package:rbux/globals.dart';

class AuthNotif extends ChangeNotifier {
  final CacheService cacheService = new CacheService();
  String? _passwordLevel = "";

  String? get passwordLevel => _passwordLevel;
  String? _passwordLevelIndic = "";
  String? get passwordLevelIndic => _passwordLevelIndic;

  // void checkPasswordStrength(var candidatePassword) {
  //   String mediumPattern = r'^(?=.*?[!@#\$&*~]).{6,}';
  //   String strongPattern =
  //       r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  //   if (candidatePassword.contains(RegExp(strongPattern))) {
  //     _passwordLevel = "strong";
  //     _passwordLevelIndic = "👌";
  //     notifyListeners();
  //   }
  //   else if (candidatePassword.contains(RegExp(mediumPattern))) {
  //     _passwordLevel = "medium";
  //     _passwordLevelIndic = "🙂";
  //     notifyListeners();
  //   }
  //   else if (!candidatePassword.contains(RegExp(mediumPattern))) {
  //     _passwordLevel = "weak";
  //     _passwordLevelIndic = "🥴";
  //     notifyListeners();
  //   }
  // }

  // Future getUserBalance({required BuildContext context}) async {
  //   try{
  //     var userBal = await _authAPI.getUserBalance();
  //     var authNotif = Provider.of<AuthNotif>(context, listen: false);
  //   String subUrl = "/balance/" + userVar;
  //   final Uri uri = Uri.parse(APIRoutes.baseURL + subUrl);
  //   try {
  //     final http.Response response = await client.get(uri, headers: headers);
  //     final statusCode = response.statusCode;
  //     final body = response.body;
  //     print(body);
  //     if (statusCode == 200) {
  //       return body;
  //     } else {
  //       print("HOLY WAKEr");
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
  //   }

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
      print(userCode);
      print(parsedValue);
      if (userCode == 201) {
        var cacheService = GetIt.I<AuthNotif>().cacheService;
        cacheService.writeCache(Key: "jwt", Value: userJWT);
        // Navigator.of(context).pushNamed(homeRoute);
        // Navigator.pushNamed(context, homeRoute);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomepageWidget()));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(userJWT)));
      }
    } catch (error) {
      print(error.toString() + "<= error");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Something Went Wrong")));
    }
  }

  // Future login(
  //     {required BuildContext context,
  //     required String username,
  //     required String password}) async {
  //   try {
  //     var _authAPI = Provider.of<AuthAPI>(context, listen: false);
  //     var userData =
  //         await _authAPI.login(username: username, password: password);
  //     final Map<String, dynamic> parsedValue = await json.decode(userData);
  //     final userJWT = parsedValue['message'];
  //     final userCode = parsedValue['code'];
  //     if (userCode == 201) {
  //       cacheService.writeCache(Key: "jwt", Value: userJWT);
  //       // Navigator.of(context).pushNamed(homeRoute);
  //       Navigator.pushNamed(context, homeRoute);
  //       print("yof");
  //     } else {
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(SnackBar(content: Text(userJWT)));
  //       print('ntog');
  //     }
  //   } catch (error) {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text("Something Went Wrong")));
  //     print(error);
  //   }
  // }

  Future decodeJWT({required dynamic token}) async {
    try {
      var _authAPI = GetIt.I.get<AuthAPI>();
      var response = GetIt.I<AuthAPI>().decodeJWT(token: token);
      return response;
    } catch (e) {
      print(e);
    }
  }

  Future login(
      {required BuildContext context,
      required String username,
      required String password}) async {
    try {
      if (username == "" || password == '') {
        print("nulllsd");
        return;
      }
      print("authy b5");
      var _authAPI = GetIt.I.get<AuthAPI>();
      var userData =
          await _authAPI.login(username: username, password: password);
      final Map<String, dynamic> parsedValue = await json.decode(userData);
      final userJWT = parsedValue['message'];
      final userCode = parsedValue['code'];
      print("authy aft");
      if (userCode == 201) {
        cacheService.writeCache(Key: "jwt", Value: userJWT);
        // Navigator.of(context).pushNamed(homeRoute);
        // Navigator.pushNamed(context, homeRoute);
        userVar = username;
        
          await GetIt.I<AuthNotif>().fetchUsername();
       

        await GetIt.I<AuthNotif>().getUserBalance();

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomepageWidget()));
        print("yof");
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(userJWT)));
        print('ntog');
      }
    } catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Something Went Wrong")));
      print(error);
      print("yeet");
    }
  }

  fetchUsername() async {
    var token = await cacheService.readCache(Key: 'jwt');
    var dataToken = await GetIt.I<AuthNotif>().decodeJWT(token: token);
    Map<String, dynamic> parsedDataToken = await jsonDecode(dataToken);
    final username = parsedDataToken['message'];
    // print(username + "<= username");

    capUserVar = userVar[0].toUpperCase() + userVar.substring(1);
    // print(username + "<== username");
    if (username == "" || username == null) {
      if (authName != "") {
        userVar = authName;
      } else {
        return print("errir hlepest daddy");
      }
    } else {
      userVar = username;
    }
  }

  getUserBalance() async {
    try {
      print("deep b4");
      var response = await GetIt.I<AuthAPI>().getUserBalance();
      print("deep aft");
      var modelledData = Bal.fromJson(jsonDecode(response));
      var postCode = modelledData.code;
      var postData = modelledData.data;
      // print(postCode.toString() + "<= postcode");
      print(postData);
      var isPostRecv = modelledData.received;
      if (isPostRecv) {
        switch (postCode) {
          case 200:
            {
              userBalance = postData;
              return postData;
            }
        }
      }
    } catch (e) {
      print(e);
      print("e ^");
    }
  }
}

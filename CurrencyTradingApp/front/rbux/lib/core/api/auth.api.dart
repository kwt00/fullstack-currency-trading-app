import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:rbux/core/notif/auth.notif.dart';
import 'package:rbux/core/services/cache.service.dart';
import 'package:rbux/rbux/routes/api.routes.dart';

import '../../globals.dart';

class AuthAPI {
  final CacheService cacheService = new CacheService();
  final client = http.Client();
  final headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Access-Control-Allow-Origin': "*"
  };
  Future getUserBalance() async {
    String subUrl = "/user/balance";
    final Uri uri = Uri.parse(APIRoutes.baseURL + subUrl);
    try {
      final http.Response response = await client.post(uri,
          body: jsonEncode({
            "username":
                (await cacheService.readCache(Key: "username")).toString()
          }),
          headers: headers);
      final statusCode = response.statusCode;
      final body = response.body;
      if (statusCode == 200) {
        return body;
      } else {}
    } catch (e) {}
  }

  Future signUp({
    required String username,
    required String userpassword,
  }) async {
    const String subUrl = "/user/signup";
    final Uri uri = Uri.parse(APIRoutes.baseURL + subUrl);
    final http.Response response = await client.post(uri,
        body: jsonEncode({
          "username": username,
          "userpassword": userpassword,
        }),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Access-Control-Allow-Origin': "*"
        });
    final statusCode = response.statusCode;
    final body = response.body;
    if (statusCode == 200) {
      return body;
    }
  }

  Future login({
    required String username,
    required String password,
  }) async {
    const String subUrl = "/user/login";
    final Uri uri = Uri.parse(APIRoutes.baseURL + subUrl);
    final http.Response response = await client.post(uri,
        body: jsonEncode({"username": username, "userpassword": password}),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Access-Control-Allow-Origin': "*"
        });
    final statusCode = response.statusCode;
    final body = response.body;
    if (statusCode == 200) {
      return body;
    }
  }

  Future decodeJWT({required dynamic token}) async {
    const String subUrl = "/user/decodejwt";
    final Uri uri = Uri.parse(APIRoutes.baseURL + subUrl);
    final http.Response response = await client.post(uri, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Access-Control-Allow-Origin': "*",
      "Authorization": token
    });
    final statusCode = response.statusCode;
    final body = response.body;
    if (statusCode == 200) {
      return body;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:rbux/core/services/cache.service.dart';
import 'package:rbux/core/views/home.dart';
import 'package:rbux/core/views/login_view.dart';
import 'package:rbux/splash.dart';

class decider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cacheService = CacheService();
    return FutureBuilder(
      future:  cacheService.readCache(Key: "jwt"),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Splash();
        }
        if(snapshot.hasData){
          return const HomepageWidget();
        }
        else{
          return LoginViewWidget();
        }
      },
    );
  }
}
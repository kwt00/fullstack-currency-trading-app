import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:rbux/core/api/transact.api.dart';
import 'package:rbux/core/notif/transaction_notif.dart';
import 'package:rbux/core/provider.dart';
import 'package:rbux/core/views/home.dart';
import 'package:rbux/core/views/transaction_history.dart';
import 'package:rbux/decider.dart';
import 'package:rbux/rbux/routes/app.routes.dart';

import 'core/api/auth.api.dart';
import 'core/notif/auth.notif.dart';

void setup() {
  GetIt.I.registerSingleton<AuthNotif>(AuthNotif());
  GetIt.I.registerSingleton<AuthAPI>(AuthAPI());
  GetIt.I.registerSingleton<TransactionAPI>(TransactionAPI());
  GetIt.I.registerSingleton<getters>(getters());
  GetIt.I.registerSingleton<HomepageWidget>(const HomepageWidget());
  GetIt.I
      .registerSingleton<TransactionNotif>(TransactionNotif());
}

void main() {
  setup();
  runApp(Core());
}

class Core extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: const Lava(),
    );
  }
}

class Lava extends StatelessWidget {
  const Lava({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: loginRoute,
      routes: routes,
    );
  }
}

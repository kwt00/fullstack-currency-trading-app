import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:rbux/core/notif/auth.notif.dart';
import 'package:rbux/core/notif/transaction_notif.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rbux/core/services/cache.service.dart';
import 'package:rbux/globals.dart';

class TransactionHistory extends StatefulWidget {
  TransactionHistory({Key? key}) : super(key: key);

  @override
  _TransactionHistory createState() => _TransactionHistory();
}

class _TransactionHistory extends State<TransactionHistory> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var transactionNotif = GetIt.I<TransactionNotif>();
  final CacheService cacheService = CacheService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: transaction_history.length > 0
            ? Padding(
              padding: const EdgeInsets.fromLTRB(0,32,0,0),
              child: ListView.builder(
                  itemCount: transaction_history.length,
                  itemBuilder: (context, index) {
                    var transactionData = transaction_history[
                        transaction_history.length - 1 - index];
                    if (username == transactionData["user"]) {
                      return ListTile(
                        leading: Icon(
                          FontAwesomeIcons.minusCircle,
                          color: Colors.red,
                        ),
                        title: Text(transactionData["transaction_title"] +
                            " For " +
                            transactionData["transaction_amount"].toString() +
                            " RBUX"),
                        subtitle: Text("Transferred from " +
                            transactionData["user"] +
                            " to " +
                            transactionData["transaction_receiver"] +
                            " on " +
                            DateTime.parse(transactionData["transaction_time"])
                                .month
                                .toString() +
                            "/" +
                            ((DateTime.parse(transactionData["transaction_time"])
                                        .day) -
                                    1)
                                .toString() +
                            "/" +
                            DateTime.parse(transactionData["transaction_time"])
                                .year
                                .toString()),
                      );
                    } else if (username ==
                        transactionData["transaction_receiver"]) {
                      return ListTile(
                        leading: Icon(FontAwesomeIcons.plusCircle,
                            color: Colors.green),
                        title: Text(transactionData["transaction_title"] +
                            " For " +
                            transactionData["transaction_amount"].toString() +
                            " RBUX"),
                        subtitle: Text("Transferred from " +
                            transactionData["user"] +
                            " to " +
                            transactionData["transaction_receiver"] +
                            " on " +
                            DateTime.parse(transactionData["transaction_time"])
                                .month
                                .toString() +
                            "/" +
                            ((DateTime.parse(transactionData["transaction_time"])
                                        .day) -
                                    1)
                                .toString() +
                            "/" +
                            DateTime.parse(transactionData["transaction_time"])
                                .year
                                .toString()),
                      );
                    }
                    return ListTile(
                      title: Text("No transaction yet :("),
                    );
                  },
                ),
            )
            : Container(
                child: Column(
                    children: [Text(transaction_history.toString())],
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center)));
  }
}

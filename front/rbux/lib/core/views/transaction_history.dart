import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:rbux/core/models/transaction_model.dart';
import 'package:rbux/core/notif/transaction_notif.dart';
import 'package:rbux/core/views/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rbux/globals.dart';

class PostList extends StatelessWidget {
  final dynamic snapshot;
  const PostList({required this.snapshot});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: snapshot.length,
      itemBuilder: (context, index) {
        Datum postData = snapshot[index];
        if (postData.user == userVar ||
            postData.transactionReciever == userVar) {
          if (userVar == postData.user) {
            return ListTile(
              leading: Icon(
                FontAwesomeIcons.minusCircle,
                color: Colors.red,
              ),
              title: Text(postData.transactionTitle +
                  " For " +
                  postData.transactionAmount.toString() +
                  " RBUX"),
              subtitle: Text("Transferred from " +
                  postData.user +
                  " to " +
                  postData.transactionReciever +
                  " on " +
                  postData.transactionTime.weekday.toString() +
                  "/" +
                  postData.transactionTime.month.toString() +
                  " " +
                  postData.transactionTime.year.toString()),
            );
          } else if (userVar == postData.transactionReciever) {
            return ListTile(
              leading: Icon(FontAwesomeIcons.plusCircle, color: Colors.green),
              title: Text(postData.transactionTitle +
                  " For " +
                  postData.transactionAmount.toString() +
                  " RBUX"),
              subtitle: Text("Transferred from " +
                  postData.user +
                  " to " +
                  postData.transactionReciever +
                  " on " +
                  postData.transactionTime.weekday.toString() +
                  "/" +
                  postData.transactionTime.month.toString() +
                  " " +
                  postData.transactionTime.year.toString()),
            );
          }
        }
        return ListTile(
          title: Text("No transactions yet :("),
        );
      },
    );
  }
}

class TRansasdfsadfacascWidget extends StatefulWidget {
  TRansasdfsadfacascWidget({Key? key}) : super(key: key);

  @override
  _TRansasdfsadfacascWidgetState createState() =>
      _TRansasdfsadfacascWidgetState();
}

class _TRansasdfsadfacascWidgetState extends State<TRansasdfsadfacascWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var transactionNotif = GetIt.I<TransactionNotif>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF000000),
      // body: Column(
      //   // mainAxisSize: MainAxisSize.max,
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      // Column(
      //   mainAxisSize: MainAxisSize.max,
      //   children: [
      //     Row(
      //       mainAxisSize: MainAxisSize.max,
      //       children: [
      //         Container(
      //           width: MediaQuery.of(context).size.width,
      //           height: 82,
      //           decoration: BoxDecoration(
      //             color: Colors.white,
      //           ),
      //           child: Padding(
      //             padding: EdgeInsetsDirectional.fromSTEB(0, 34, 0, 0),
      //             child: Column(
      //               mainAxisSize: MainAxisSize.max,
      //               children: [
      //                 Padding(
      //                   padding:
      //                       EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
      //                   child: Row(
      //                     mainAxisSize: MainAxisSize.max,
      //                     children: [
      //                       Text(
      //                         'Transactions',
      //                         style: FlutterFlowTheme.title1.override(
      //                           fontFamily: 'Lexend Deca',
      //                           color: Color(0xFF090F13),
      //                           fontSize: 28,
      //                           fontWeight: FontWeight.w500,
      //                         ),
      //                       ),
      //                       Expanded(
      //                         child: Align(
      //                           alignment: AlignmentDirectional(0.75, 0),
      //                           child: Icon(
      //                             Icons.search_rounded,
      //                             color: Color(0xFF15212B),
      //                             size: 24,
      //                           ),
      //                         ),
      //                       ),
      //                       Padding(
      //                         padding: EdgeInsetsDirectional.fromSTEB(
      //                             0, 0, 16, 0),
      //                         child: Icon(
      //                           Icons.more_vert,
      //                           color: Color(0xFF15212B),
      //                           size: 24,
      //                         ),
      //                       )
      //                     ],
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ),
      //         )
      //       ],
      //     )
      //   ],
      // ),
      // Expanded(
      //   child: SingleChildScrollView(
      // child:
      //  Column(
      // mainAxisSize: MainAxisSize.min,
      // mainAxisAlignment: MainAxisAlignment.center,
      // children: [
      body: FutureBuilder(
          future: transactionNotif.fetchTransactionHistory(
              context: context, user: userVar),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              var _snapshot = snapshot.data as List<dynamic>;
              return PostList(snapshot: _snapshot);
            }
          }),
      //   ],
      // ),
      // ]
      // )
    );
    //       )
    //     ],
    //   ),
    // );
  }
}

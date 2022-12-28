import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rbux/core/notif/auth.notif.dart';
import 'package:rbux/core/notif/transaction_notif.dart';
import 'package:rbux/core/views/home.dart';
import 'package:rbux/globals.dart';
import 'package:rbux/rbux/routes/app.routes.dart';
import 'dart:core';

import '../../flutter_flow/flutter_flow_icon_button.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';

class AddTransactionWidget extends StatefulWidget {
  AddTransactionWidget({Key? key}) : super(key: key);

  @override
  _AddTransactionWidgetState createState() => _AddTransactionWidgetState();
}

class _AddTransactionWidgetState extends State<AddTransactionWidget>
    with TickerProviderStateMixin {
  late TextEditingController amountController;
  late TextEditingController transactionTitleController;
  late TextEditingController transactionRecvController;
  bool _loadingButton = false;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    amountController = TextEditingController();
    transactionTitleController = TextEditingController();
    transactionRecvController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var transactionNotif = Provider.of<TransactionNotif>(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Form(
        key: formKey,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFF4B39EF),
          body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Material(
                    color: Colors.transparent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                      ),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 44, 20, 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Add Transaction',
                                  style: FlutterFlowTheme.title1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF090F13),
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    Navigator.popAndPushNamed(context, homeRoute);
                                  },
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: Color(0xFFDBE2E7),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      buttonSize: 48,
                                      icon: Icon(
                                        Icons.close_rounded,
                                        color: Color(0xFF95A1AC),
                                        size: 30,
                                      ),
                                      onPressed: () async {
                                        Navigator.popAndPushNamed(
                                            context, homeRoute);
                                      },
                                      borderWidth: 0,
                                      fillColor: Colors.transparent,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 75,
                              constraints: BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width * 0.8,
                              ),
                              decoration: BoxDecoration(),
                              child: Padding(
                                  padding:
                                      EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                                  child: TextFormField(
                                    controller: amountController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Amount',
                                      hintStyle: FlutterFlowTheme.title1.override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF95A1AC),
                                        fontSize: 24,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFDBE2E7),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFDBE2E7),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              20, 24, 24, 24),
                                      prefixIcon: Icon(
                                        Icons.attach_money_rounded,
                                        color: Color(0xFF1E2429),
                                        size: 32,
                                      ),
                                    ),
                                    style: FlutterFlowTheme.title1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFFDC8D55),
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                    validator: (val) {
                                      return null;
                                    },
                                  )),
                            ),
                            Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                                child: TextFormField(
                                  controller: transactionTitleController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Transaction Title...',
                                    hintStyle: FlutterFlowTheme.bodyText2.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF8B97A2),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFDBE2E7),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFDBE2E7),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    contentPadding: EdgeInsetsDirectional.fromSTEB(
                                        20, 24, 24, 24),
                                  ),
                                  style: FlutterFlowTheme.bodyText2.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF8B97A2),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                )),
                            Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                                child: TextFormField(
                                  controller: transactionRecvController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Transaction Receiver...',
                                    hintStyle: FlutterFlowTheme.bodyText2.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF8B97A2),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFDBE2E7),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFDBE2E7),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    contentPadding: EdgeInsetsDirectional.fromSTEB(
                                        20, 24, 24, 24),
                                  ),
                                  style: FlutterFlowTheme.bodyText2.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF8B97A2),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                )),
                            Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                                child: SizedBox(
                                    height: 170,
                                    width: 200,
                                    // width: MediaQuery.of(context).size.width,
                                    child: TextButton(
                                        onPressed: () async {
                                          setState(() => _loadingButton = true);
                                          try {
                                            if (num.tryParse(
                                                    amountController.text) ==
                                                null) {
                                              return showSnackbar(context,
                                                  "Please Enter an Amount Number");
                                            }
                                            if (amountController.text
                                                .contains(".")) {
                                              return showSnackbar(
                                                  context, "Enter a whole number!");
                                            }
                                            if (num.tryParse(
                                                    amountController.text)! <=
                                                0) {
                                              return showSnackbar(context,
                                                  "Nice try, an amount over 0 please");
                                            }
                                            if (transactionRecvController.text ==
                                                username) {
                                              return showSnackbar(
                                                  context, "...Why...");
                                            }
                                            await GetIt.I<TransactionNotif>()
                                                .addTransaction(
                                                    transaction_receiver:
                                                        transactionRecvController
                                                            .text
                                                            .toLowerCase(),
                                                    transaction_amount:
                                                        num.tryParse(
                                                            amountController.text)!,
                                                    transaction_title:
                                                        transactionTitleController
                                                            .text,
                                                    context: context);
                                            await GetIt.I<AuthNotif>()
                                                .getUserBalance();
                                          } finally {
                                            setState(() => _loadingButton = false);
                                          }
                                        },
                                        style: ButtonStyle(
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(16.0),
                                                    side: BorderSide(
                                                        color: Color(0xFFDBE2E7)))),
                                            splashFactory: InkSplash.splashFactory),
                                        child: Text(
                                          "Add Transaction",
                                          style: TextStyle(),
                                        )),
                                  ),
                                ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 28, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [],
                        )
                      ],
                    ),
                  ),
                  Text(
                    'Tap above to complete request',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

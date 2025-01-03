// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:rbux/core/notif/auth.notif.dart';
// import 'package:rbux/core/notif/transaction_notif.dart';

// class AddPostView extends StatefulWidget {
//   const AddPostView({Key? key}) : super(key: key);

//   @override
//   State<AddPostView> createState() => _AddPostViewState();
// }

// class _AddPostViewState extends State<AddPostView> {
//   TextEditingController titleController = TextEditingController();
//   TextEditingController messageController = TextEditingController();
//   TextEditingController amountController = TextEditingController();
//   TextEditingController receiverController = TextEditingController();

//   @override
//   void initState() {
//     titleController = TextEditingController();
//     messageController = TextEditingController();
//     amountController = TextEditingController();
//     receiverController = TextEditingController();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     TransactionNotif transactionNotif(bool renderUi) =>
//         Provider.of<TransactionNotif>(context, listen: renderUi);
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(),
//       body: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             TextField(
//               controller: titleController,
//               decoration: InputDecoration(hintText: "Enter Title..."),
//             ),
//             const SizedBox(height: 10),
//             TextField(
//               controller: messageController,
//               decoration: InputDecoration(hintText: "Enter Message..."),
//             ),
//             const SizedBox(height: 10),
//             TextField(
//               controller: amountController,
//               decoration: InputDecoration(hintText: "Enter Amount..."),
//             ),
//             const SizedBox(height: 10),
//             TextField(
//               controller: receiverController,
//               decoration: InputDecoration(hintText: "Enter Receiver..."),
//             ),
//             const SizedBox(height: 10),
//             MaterialButton(
//                 onPressed: () async {
//                   final username = await AuthNotif().fetchUsername(context: context);
//                   await transactionNotif(false).addTransaction(
//                       user: username.toString(),
//                       transaction_reciever: receiverController.text,
//                       transaction_amount: int.parse(amountController.text),
//                       transaction_message: messageController.text,
//                       transaction_title: titleController.text,
//                       context: context);
//                 },
//                 child: Text("Send RbuX"))
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rbux/core/notif/auth.notif.dart';
import 'package:rbux/core/notif/transaction_notif.dart';
import 'package:rbux/core/views/flutter_flow/flutter_flow_util.dart';
import 'package:rbux/core/views/home.dart';
import 'package:rbux/globals.dart';
import 'package:rbux/rbux/routes/app.routes.dart';
import 'flutter_flow/flutter_flow_icon_button.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_widgets.dart';
import 'dart:core';

class AddTransactionWidget extends StatefulWidget {
  AddTransactionWidget({Key? key}) : super(key: key);

  @override
  _AddTransactionWidgetState createState() => _AddTransactionWidgetState();
}

class _AddTransactionWidgetState extends State<AddTransactionWidget>
    with TickerProviderStateMixin {
  late TextEditingController textController1;
  late TextEditingController transactionTitleController;
  late TextEditingController transactionRecvController;
  late TextEditingController transactionMessageController;
  bool _loadingButton = false;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  // final animationsMap = {
  //   'textFieldOnPageLoadAnimation1': AnimationInfo(
  //     trigger: AnimationTrigger.onPageLoad,
  //     duration: 600,
  //     fadeIn: true,
  //     slideOffset: Offset(0, -40),
  //   ),
  //   'textFieldOnPageLoadAnimation2': AnimationInfo(
  //     trigger: AnimationTrigger.onPageLoad,
  //     duration: 600,
  //     delay: 170,
  //     fadeIn: true,
  //     slideOffset: Offset(0, -80),
  //   ),
  //   'textFieldOnPageLoadAnimation3': AnimationInfo(
  //     trigger: AnimationTrigger.onPageLoad,
  //     duration: 600,
  //     delay: 170,
  //     fadeIn: true,
  //     slideOffset: Offset(0, -80),
  //   ),
  //   'textFieldOnPageLoadAnimation4': AnimationInfo(
  //     trigger: AnimationTrigger.onPageLoad,
  //     duration: 600,
  //     delay: 230,
  //     fadeIn: true,
  //     slideOffset: Offset(0, -120),
  //   ),
  // };

  @override
  void initState() {
    super.initState();
    // startPageLoadAnimations(
    //   animationsMap.values
    //       .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
    //   this,
    // );

    textController1 = TextEditingController();
    transactionTitleController = TextEditingController();
    transactionRecvController = TextEditingController();
    transactionMessageController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var transactionNotif =
        Provider.of<TransactionNotif>(context, listen: false);
    return WillPopScope(
      onWillPop: () async => false,
      child: Form(
        key: formKey,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFF4B39EF),
          body: Column(
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
                                controller: textController1,
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
                              )
                              // .animated(
                              //     [animationsMap['textFieldOnPageLoadAnimation1']]),
                              ),
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
                            )
                            // .animated(
                            //     [animationsMap['textFieldOnPageLoadAnimation2']]),
                            ),
                        Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                            child: TextFormField(
                              controller: transactionRecvController,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Transaction Reciever...',
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
                            )
                            // .animated(
                            //     [animationsMap['textFieldOnPageLoadAnimation3']]),
                            ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                          // child: TextFormField(
                          //   controller: transactionMessageController,
                          //   obscureText: false,
                          //   decoration: InputDecoration(
                          //     hintText: 'Transaction Message...',
                          //     hintStyle: FlutterFlowTheme.bodyText1.override(
                          //       fontFamily: 'Lexend Deca',
                          //       color: Color(0xFF090F13),
                          //       fontSize: 14,
                          //       fontWeight: FontWeight.normal,
                          //     ),
                          //     enabledBorder: OutlineInputBorder(
                          //       borderSide: BorderSide(
                          //         color: Color(0xFFDBE2E7),
                          //         width: 2,
                          //       ),
                          //       borderRadius: BorderRadius.circular(8),
                          //     ),
                          //     focusedBorder: OutlineInputBorder(
                          //       borderSide: BorderSide(
                          //         color: Color(0xFFDBE2E7),
                          //         width: 2,
                          //       ),
                          //       borderRadius: BorderRadius.circular(8),
                          //     ),
                          //     contentPadding:
                          //         EdgeInsetsDirectional.fromSTEB(20, 40, 24, 0),
                          //   ),
                          //   style: FlutterFlowTheme.bodyText1.override(
                          //     fontFamily: 'Lexend Deca',
                          //     color: Color(0xFF1E2429),
                          //     fontSize: 14,
                          //     fontWeight: FontWeight.normal,
                          //   ),
                          //   textAlign: TextAlign.start,
                          //   maxLines: 4,
                          // )
                          // .animated(
                          //     [animationsMap['textFieldOnPageLoadAnimation4']]),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            setState(() => _loadingButton = true);
                            try {
                              if (num.tryParse(textController1.text) == null) {
                                return showSnackbar(
                                    context, "Please Enter an Amount Number");
                              }
                              if (textController1.text.contains(".")) {
                                return showSnackbar(
                                    context, "Enter a whole number!");
                              }
                              if (num.tryParse(textController1.text)! <= 0) {
                                return showSnackbar(context,
                                    "Nice try, an amount over 0 please");
                              }
                              await transactionNotif.addTransaction(
                                  user: userVar,
                                  transaction_reciever:
                                      transactionRecvController.text
                                          .toLowerCase(),
                                  transaction_amount:
                                      num.tryParse(textController1.text)!,
                                  transaction_message: "",
                                  transaction_title:
                                      transactionTitleController.text,
                                  context: context);
                              await GetIt.I<AuthNotif>().getUserBalance();
                              // Future.delayed(const Duration(milliseconds: 4000),
                              //     () {
                              //   Navigator.pop(context);
                              // });

                            } finally {
                              setState(() => _loadingButton = false);
                            }
                          },
                          text: 'Add Transaction',
                          options: FFButtonOptions(
                            width: 300,
                            height: 70,
                            color: Color(0xFF4B39EF),
                            textStyle: FlutterFlowTheme.title1.override(
                              fontFamily: 'Lexend Deca',
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            elevation: 0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 12,
                            iconColor: Colors.transparent,
                            iconPadding: EdgeInsets.all(0),
                            iconSize: 0,
                            padding: EdgeInsets.all(0),
                          ),
                          loading: _loadingButton,
                          icon: Icon(null),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Text(
                'Tap above to complete request',
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Lexend Deca',
                  color: Color(0x81000000),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:rbux/core/notif/auth.notif.dart';
// import 'package:rbux/widget/button.dart';
// import 'package:rbux/widget/first.dart';
// import 'package:rbux/widget/inputEmail.dart';
// import 'package:rbux/widget/password.dart';
// import 'package:rbux/widget/textLogin.dart';
// import 'package:rbux/widget/verticalText.dart';

// class Login extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<Login> {
//   final usernameController = TextEditingController();
//   final passwordController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {

//     var authNotif = Provider.of<AuthNotif>(context, listen: false);
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("assets/images/whitesnow.png"),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: ListView(
//           children: <Widget>[
//             SizedBox(height: 175),
//             Container(
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 color: Color.fromRGBO(0, 0, 0, 0.5),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(50),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     TextField(
//                       controller: usernameController,
//                       style: TextStyle(
//                         color: Colors.white,
//                       ),
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15),
//                             borderSide: new BorderSide(color: Colors.white)),
//                         hintText: "Enter Username...",
//                       ),
//                     ),
//                     SizedBox(height: 50),
//                     TextField(
//                       controller: passwordController,
//                       style: TextStyle(
//                         color: Colors.white,
//                       ),
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15),
//                             borderSide: new BorderSide(color: Colors.white)),
//                         hintText: "Enter Password...",
//                       ),
//                     ),

//                     SizedBox(height: 45),
//                     Container(
//                       height: 50,
//                       width: MediaQuery.of(context).size.width,
//                       decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.white,
//                             blurRadius:
//                                 10.0, // has the effect of softening the shadow
//                             spreadRadius:
//                                 1.0, // has the effect of extending the shadow
//                             offset: Offset(
//                               5.0, // horizontal, move right 10
//                               5.0, // vertical, move down 10
//                             ),
//                           ),
//                         ],
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       child: FlatButton(
//                         onPressed: () {
//                           authNotif.login(
//                               context: context,
//                               username: usernameController.text,
//                               password: passwordController.text);
//                         },
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             Text(
//                               'Login',
//                               style: TextStyle(
//                                 color: Colors.lightBlueAccent,
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w700,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 45),
//                     FirstTime(),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:rbux/core/notif/auth.notif.dart';
import 'package:rbux/core/views/flutter_flow/flutter_flow_util.dart';
import 'package:rbux/core/views/flutter_flow/flutter_flow_widgets.dart';
import 'package:rbux/core/views/home.dart';
import 'package:rbux/globals.dart';
import 'package:rbux/rbux/routes/app.routes.dart';
import 'package:url_launcher/url_launcher.dart';

import 'flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginViewWidget extends StatefulWidget {
  // LoginViewWidget({Key key}) : super(key: key);

  @override
  _LoginViewWidgetState createState() => _LoginViewWidgetState();
}

class _LoginViewWidgetState extends State<LoginViewWidget> {
  late TextEditingController passwordController;
  late bool passwordVisibility;
  late TextEditingController usernameController;
  bool _loadingButton1 = false;
  bool _loadingButton2 = false;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    passwordVisibility = false;
    usernameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var authNotif = Provider.of<AuthNotif>(context, listen: false);
    return WillPopScope(
      onWillPop: () async => false,
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFF4B39EF),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF05C1FE), Colors.black],
                stops: [0, 1],
                begin: AlignmentDirectional(0, -1),
                end: AlignmentDirectional(0, 1),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 70, 0, 90),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/rbuxlogo.png',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: TextFormField(
                                controller: usernameController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Username',
                                  labelStyle:
                                      FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF95A1AC),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  hintText: 'Enter your username here...',
                                  hintStyle:
                                      FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF95A1AC),
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
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          16, 24, 0, 24),
                                ),
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF2B343A),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                                // validator: (val) {
                                //   if (val!.isEmpty) {
                                //     return 'Please Enter Your Username!';
                                //   }

                                //   return null;
                                // },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: !passwordVisibility,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle:
                                      FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF95A1AC),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  hintText: 'Enter your password here...',
                                  hintStyle:
                                      FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF95A1AC),
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
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          16, 24, 24, 24),
                                  suffixIcon: InkWell(
                                    onTap: () => setState(
                                      () => passwordVisibility =
                                          !passwordVisibility,
                                    ),
                                    child: Icon(
                                      passwordVisibility
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: Color(0xFF95A1AC),
                                      size: 22,
                                    ),
                                  ),
                                ),
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF2B343A),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  //     .then((val) {
                                  //   print(userVar + "<==useeer var");
                                  //   print(authName + "<=== authee name");
                                  //   print(val + "this is val");
                                  //   print(userBalance + "this is user bal");
                                  //   if (authName == userVar) {
                                  //     userBalance = val;
                                  //   } else {
                                  //     print("woah there poopist");
                                  //   }
                                  //   print("ocdssdc");
                                  // });

                                  print("made to login");
                                  print(usernameController.text.toLowerCase());
                                  authNotif.login(
                                      context: context,
                                      username:
                                          usernameController.text.toLowerCase(),
                                      password: passwordController.text);
                                  authName =
                                      usernameController.text.toLowerCase();
                                  print(authName + "<== authname");
                                  print('b4');
                                },
                                text: 'Login',
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 60,
                                  color: Color(0xFF090F13),
                                  textStyle:
                                      FlutterFlowTheme.subtitle1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  elevation: 3,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 8,
                                  iconSize: 100,
                                  iconColor: Colors.black,
                                  iconPadding: EdgeInsets.all(0),
                                  padding: EdgeInsets.all(15),
                                ),
                                loading: _loadingButton1,
                                icon: const Icon(null),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 45, 0, 0),
                      // padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 100),
                                child: FFButtonWidget(
                                    onPressed: () {
                                      Navigator.pushNamed(context, signupRoute);
                                    },
                                    text: 'Sign Up',
                                    options: FFButtonOptions(
                                      width: 200,
                                      height: 30,
                                      color: Color(0x00FFFFFF),
                                      textStyle:
                                          FlutterFlowTheme.subtitle2.override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF39D2C0),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      elevation: 0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: 0,
                                      iconSize: 100,
                                      iconColor: Colors.black,
                                      iconPadding: EdgeInsets.all(5),
                                      padding: EdgeInsets.all(0),
                                    ),
                                    loading: _loadingButton2,
                                    icon: Icon(null),
                              ),
                            ),
                      )]),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            child: Text(
                              "Created my free logo at LogoMakr.com",
                              style:
                                  TextStyle(fontSize: 3, color: Colors.white10),
                            ),
                            onPressed: () async {
                              await canLaunch("logomakr.com")
                                  ? await launch("logomakr.com")
                                  : print("");
                            },
                          ),
                        ]),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

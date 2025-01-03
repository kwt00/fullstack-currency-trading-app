// import 'dart:async';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:rbux/core/notif/auth.notif.dart';
// import 'package:rbux/rbux/routes/app.routes.dart';

// class SignupView extends StatefulWidget {
//   const SignupView({Key? key}) : super(key: key);

//   @override
//   State<SignupView> createState() => _SignupViewState();

// }

// class _SignupViewState extends State<SignupView> {
//   @override
//   Widget build(BuildContext context) {
//     final emailController = TextEditingController();
//     var passwordController = TextEditingController();
//     final nameController = TextEditingController();
//     AuthNotif authNotif(bool renderUI) =>
//         Provider.of<AuthNotif>(context, listen: (renderUI));

//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: const Text('SignUp View'),
//       ),
//       body: Container(
//           child: Center(
//               child: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             TextField(
//               controller: emailController,
//               decoration: const InputDecoration(hintText: "Enter Email"),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             TextField(
//               controller: passwordController,
//               decoration: const InputDecoration(hintText: "Enter Password"),
//               // onChanged: (val) {
//               //   authNotif(false).checkPasswordStrength(val);
//               //   print(val);
//               // },
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Row(
//               children: [
//                 SizedBox(width: 10),
//                 Text(authNotif(true).passwordLevelIndic!),
//                 if (authNotif(true).passwordLevel! == "weak")
//                   AnimatedContainer(
//                     duration: Duration(seconds: 2),
//                     width: 100,
//                     height: 10,
//                     curve: Curves.easeIn,
//                     decoration: BoxDecoration(
//                       color: Colors.red,
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                   ),
//                 if (authNotif(true).passwordLevel! == "medium")
//                   AnimatedContainer(
//                     duration: Duration(seconds: 2),
//                     width: 220,
//                     height: 10,
//                     curve: Curves.easeIn,
//                     decoration: BoxDecoration(
//                       color: Colors.yellow,
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                   ),
//                 if (authNotif(true).passwordLevel! == "strong")
//                   AnimatedContainer(
//                     duration: Duration(seconds: 2),
//                     width: 360,
//                     height: 10,
//                     curve: Curves.easeInOutQuad,
//                     decoration: BoxDecoration(
//                       color: Colors.green,
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                   ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             TextField(
//               controller: nameController,
//               decoration: const InputDecoration(hintText: "Enter Username"),
//             ),
//             const SizedBox(
//               height: 60,
//             ),
//             MaterialButton(
//               child: const Text("Sign Up"),
//               color: Colors.red,
//               onPressed: () {
//                 authNotif(false).signup(
//                     context: context,
//                     name: nameController.text.toLowerCase(),
//                     password: passwordController.text);
//               },
//             ),
//             const SizedBox(
//               height: 60,
//             ),
//             TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pushNamed(loginRoute);
//                 },
//                 child: const Text("Have An Account? Login")),
//           ],
//         ),
//       ))),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rbux/core/notif/auth.notif.dart';
import 'package:rbux/rbux/routes/app.routes.dart';

import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/flutter_flow_widgets.dart';

class SignupWidget extends StatefulWidget {
  SignupWidget({Key? key}) : super(key: key);

  @override
  _SignupWidgetState createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  late TextEditingController passwordController;
  late bool passwordVisibility;
  late TextEditingController usernameController;
  bool _loadingButton = false;
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
    AuthNotif authNotif(bool renderUI) =>
        Provider.of<AuthNotif>(context, listen: (renderUI));
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF14181B),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: Color(0xFF14181B),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: Image.asset(
                'assets/images/istockphoto-1257005098-170667a.jpg',
              ).image,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 79, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 35, 20, 0),
                    child: DefaultTabController(
                      length: 1,
                      initialIndex: 0,
                      child: Column(
                        children: [
                          TabBar(
                            labelColor: Colors.white,
                            labelStyle: GoogleFonts.getFont(
                              'Roboto',
                            ),
                            indicatorColor: Colors.white,
                            tabs: [
                              Tab(
                                text: '\n',
                              )
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 20, 0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 38, 0, 0),
                                          child: TextFormField(
                                            controller: usernameController,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Username',
                                              labelStyle: FlutterFlowTheme
                                                  .bodyText1
                                                  .override(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF95A1AC),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                              hintText:
                                                  'Enter your username...',
                                              hintStyle: FlutterFlowTheme
                                                  .bodyText1
                                                  .override(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF95A1AC),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(20, 24, 20, 24),
                                            ),
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF14181B),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 40, 0, 0),
                                          child: TextFormField(
                                            controller: passwordController,
                                            obscureText: !passwordVisibility,
                                            decoration: InputDecoration(
                                              labelText: 'Password',
                                              labelStyle: FlutterFlowTheme
                                                  .bodyText1
                                                  .override(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF95A1AC),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                              hintText:
                                                  'Enter your password...',
                                              hintStyle: FlutterFlowTheme
                                                  .bodyText1
                                                  .override(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF95A1AC),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(20, 24, 20, 24),
                                              suffixIcon: InkWell(
                                                onTap: () => setState(
                                                  () => passwordVisibility =
                                                      !passwordVisibility,
                                                ),
                                                child: Icon(
                                                  passwordVisibility
                                                      ? Icons
                                                          .visibility_outlined
                                                      : Icons
                                                          .visibility_off_outlined,
                                                  color: Color(0xFF95A1AC),
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF14181B),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 40, 0, 0),
                                          child: FFButtonWidget(
                                              onPressed: () {
                                                if (usernameController.text
                                                    .contains(" ")) {
                                                  return showSnackbar(context,
                                                      "Please Enter Your Username!");
                                                }
                                                if (passwordController.text
                                                    .contains(" ")) {
                                                  return showSnackbar(context,
                                                      "Please Enter Your Password!");
                                                }
                                                if (passwordController
                                                        .text.length <
                                                    6) {
                                                  return showSnackbar(context,
                                                      "Password must be at least 6 characters");
                                                }
                                                if (usernameController
                                                        .text.length <
                                                    3) {
                                                  return showSnackbar(context,
                                                      "Username must be at least 3 characters");
                                                }
                                                final result =
                                                    usernameController.text
                                                        .replaceAll(
                                                            RegExp(
                                                                '[^A-Za-z0-9]'),
                                                            ' ');
                                                if (result.contains(' ')) {
                                                  showSnackbar(context,
                                                      "No Special Characters!");
                                                  return;
                                                }
                                                authNotif(false).signup(
                                                    context: context,
                                                    name: usernameController
                                                        .text
                                                        .toLowerCase(),
                                                    password: passwordController
                                                        .text);
                                              },
                                              text: 'Sign Up',
                                              options: FFButtonOptions(
                                                width: 230,
                                                height: 60,
                                                color: Colors.white,
                                                textStyle: FlutterFlowTheme
                                                    .subtitle2
                                                    .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Color(0xFF39D2C0),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                                elevation: 3,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius: 8,
                                                iconColor: Colors.black,
                                                iconPadding: EdgeInsets.all(0),
                                                iconSize: 0,
                                                padding: EdgeInsets.all(0),
                                              ),
                                              loading: _loadingButton,
                                              icon: Icon(null),
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 16, 20, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 35, 0, 0),
                                                child: TextButton(
                                                  child: Text(
                                                    'Login',
                                                    style: FlutterFlowTheme
                                                        .bodyText1
                                                        .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color: Color(0x98FFFFFF),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.pushNamed(
                                                        context, loginRoute);
                                                  },
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:rbux/core/views/transaction_history.dart';
import 'package:rbux/decider.dart';
import 'package:rbux/core/views/add_transaction_view.dart';
import 'package:rbux/core/views/home.dart';
import 'package:rbux/core/views/login_view.dart';
import 'package:rbux/core/views/signup_view.dart';

const String loginRoute = "/login";
const String signupRoute = "/signup";
const String homeRoute = "/";
const String deciderRoute = "/decider";
const String addTransactionRoute = "/add-transaction";
const String transactionHistory = "/transaction-history";
final routes = {
  loginRoute: (context) => LoginViewWidget(),
  signupRoute: (context) => SignupWidget(),
  deciderRoute: (context) => decider(),
  homeRoute: (context) => HomepageWidget(),
  transactionHistory: (context) => TRansasdfsadfacascWidget(),
  addTransactionRoute: (context) => AddTransactionWidget(),
};

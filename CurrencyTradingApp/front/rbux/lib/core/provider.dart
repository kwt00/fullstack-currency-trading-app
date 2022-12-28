import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:rbux/core/notif/transaction_notif.dart';
import 'package:rbux/main.dart';

import 'notif/auth.notif.dart';

List<SingleChildWidget> providers = [...remoteProvider];

List<SingleChildWidget> remoteProvider = [
  ChangeNotifierProvider(create: (_)=>AuthNotif()),
  ChangeNotifierProvider(create: (_)=>TransactionNotif()),
];
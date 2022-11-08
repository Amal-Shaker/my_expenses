import 'package:flutter/material.dart';
import 'package:my_expenses/Helper/sharedpref.dart';

import '../Helper/db_helper.dart';

class Application {
  static intApp() async {
    WidgetsFlutterBinding.ensureInitialized();

    await DbHelper.instance.intDatabase();
    await SharedPreferencesHelper.instance.intSharedPref();
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static var instance = SharedPreferencesHelper();
  SharedPreferences? sharedpref;
  intSharedPref() async {
    sharedpref = await SharedPreferences.getInstance();
  }
}

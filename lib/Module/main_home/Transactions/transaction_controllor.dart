import 'package:get/get.dart';
import 'package:intl/intl.dart' as int;
// import 'package:my_expenses/Model/detail_expenses.dart';

// import '../../../Helper/db_helper.dart';
// import '../../../Helper/sharedpref.dart';

class TransactionControllor extends GetxController {
  String date = int.DateFormat('yyyy-MM-dd').format(DateTime.now());
  String time = int.DateFormat('hh:mm a').format(DateTime.now());
  // double? totalSalary = 0;
  // List<DetailExpenses> detailExpenses = [];
  // getSalary() {
  //   var pref = SharedPreferencesHelper.instance.sharedpref!;
  //   totalSalary = pref.getDouble('salary');
  //   update();
  // }

  // insertDetailsExpenses(DetailExpenses detailExpenses) async {
  //   await DbHelper.instance.insertExpensesDetails(detailExpenses);
  //   await getAllDetailsExpenses();
  //   update();
  // }

  // getAllDetailsExpenses() async {
  //   detailExpenses = await DbHelper.instance.getAllDetailsExpenses();
  //   update();
  // }

  @override
  void onInit() {
    // getSalary();

    // getAllDetailsExpenses();
    super.onInit();
  }
}

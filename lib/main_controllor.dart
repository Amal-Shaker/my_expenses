import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'Helper/db_helper.dart';
import 'Helper/sharedpref.dart';
import 'Model/category.dart';
import 'Model/expenses.dart';
import 'Model/pie_data.dart';

class MainControllor extends GetxController {
  bool isDark = false;
  var pref = SharedPreferencesHelper.instance.sharedpref!;
  String? currency = "\$";
  Locale l = Locale('ar', 'AR');
  Category? catById;
  // List<Expenses>? allExpenses;
  // List<PieData>? pieData = [];
  // getCategoryById(int? id) async {
  //   catById = await DbHelper.instance.getCategoryById(id);
  //   update();
  // }

  convertLanguage() {
    l = l == Locale('ar', 'AR') ? Locale('en', 'Us') : Locale('ar', 'AR');
  }

  convertToDark() {
    isDark = !isDark;
    update();
  }

  addCurrency(String? currency) async {
    await pref.setString('currency', currency!);
    update();
  }

  getCurrency() async {
    currency = await pref.getString('currency') ?? '\$';
    update();
  }

  // getAllExpenses() async {
  //   allExpenses = await DbHelper.instance.getAllExpenses();
  //   allExpenses!.map((e) async {
  //     await getCategoryById(e.category_id);
  //     pieData!.add(PieData(catById!.name!, e.price!, catById!.name!));
  //     // pieData!.add(PieData(
  //     //     e.category_id!.toString(), e.price!, e.category_id!.toString()));
  //   }).toList();
  //   update();
  // }

  @override
  void onInit() {
    // TODO: implement onInit
    //getAllExpenses();
    getCurrency();
    super.onInit();
  }
}

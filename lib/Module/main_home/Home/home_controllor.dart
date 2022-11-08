import 'package:get/get.dart';
import 'package:my_expenses/Model/expenses.dart';
import 'package:intl/intl.dart' as intl;
import 'package:my_expenses/Model/pie_data.dart';

import '../../../Helper/db_helper.dart';
import '../../../Helper/sharedpref.dart';
import '../../../Model/category.dart';
import '../../../Model/detail_expenses.dart';

class HomeControllor extends GetxController {
  List<Category>? allCategory;
  List<Expenses>? allExpenses;
  List<DetailExpenses>? detailExpenses = [];
  Category? selectCategory;
  double? totalSalary = 0;
  double? totalExpenses = 0;
  String date = intl.DateFormat('yyyy-MM-dd').format(DateTime.now());
  String time = intl.DateFormat('hh:mm a').format(DateTime.now());
  Category? catById;

  List<PieData>? pieData = [];
  getAllCategory() async {
    allCategory = await DbHelper.instance.getAllCategory();
    update();
  }

  getCategoryById(int? id) async {
    catById = await DbHelper.instance.getCategoryById(id);
    update();
  }

  getAllExpenses() async {
    allExpenses = await DbHelper.instance.getAllExpenses();
    pieData!.clear();
    allExpenses!.map((e) async {
      await getCategoryById(e.category_id);
      pieData!.add(PieData(catById!.name!, e.price!, catById!.name!));
      // pieData!.add(PieData(
      //     e.category_id!.toString(), e.price!, e.category_id!.toString()));
    }).toList();
    update();
  }

  insertCategory(Category category) async {
    await DbHelper.instance.insertCategory(category);
    getAllCategory();
    update();
  }

  insertDetailsExpenses(DetailExpenses detailExpenses) async {
    await DbHelper.instance.insertExpensesDetails(detailExpenses);
    getAllDetailsExpenses();
    update();
  }

  getAllDetailsExpenses() async {
    detailExpenses = await DbHelper.instance.getAllDetailsExpenses();
    update();
  }

  insertExpenses(Expenses expenses) async {
    bool catExist = false;
    Expenses? ex;
    allExpenses!.map((e) {
      if (expenses.category_id == e.category_id) {
        e.price = (expenses.price!) + (e.price!);
        ex = e;
        // print('eeeeeeeeeeeeeeeeeeeeeeeeeee');

        ////print(e.toJson());
        // print('exeexexxxxxxxxxxxxxxxxxx');
        // print(ex!.toJson());
        // print(expenses.price);
        catExist = true;
      }
    }).toList();
    catExist
        ? await DbHelper.instance.updateExpenses(ex!)
        : await DbHelper.instance.insertExpenses(expenses);
    await getAllExpenses();
    // await getAllDetailsExpenses();
    update();
  }

  insertSalary(double insertsalary) async {
    var pref = SharedPreferencesHelper.instance.sharedpref!;
    double? salary = pref.getDouble('salary');
    salary == null
        ? await pref.setDouble('salary', insertsalary)
        : await pref.setDouble('salary', (insertsalary + salary));
    update();
  }

  getSalary() {
    var pref = SharedPreferencesHelper.instance.sharedpref!;
    totalSalary = pref.getDouble('salary');
    update();
  }

  getTotalExpenses() async {
    totalExpenses = await DbHelper.instance.getTotalExpenses();
    update();
  }

  @override
  void onInit() {
    getAllCategory();
    getAllExpenses();
    getSalary();
    getTotalExpenses();
    getAllDetailsExpenses();
    super.onInit();
  }
}

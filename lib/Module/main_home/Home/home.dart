import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_expenses/Model/detail_expenses.dart';
import 'package:my_expenses/Model/expenses.dart';
import 'package:my_expenses/Module/main_home/Home/home_controllor.dart';
import 'package:my_expenses/Module/main_home/Home/widgets/add_category_row.dart';
import 'package:my_expenses/Module/main_home/Home/widgets/add_expenses_row.dart';
import 'package:my_expenses/Module/main_home/Home/widgets/chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Model/category.dart';
import '../../../main_controllor.dart';

class Home extends StatelessWidget {
  Home({super.key});

  TextEditingController? catControllor = TextEditingController();
  TextEditingController? expControllor = TextEditingController();
  TextEditingController? amountControllor = TextEditingController();
  MainControllor mainControllor = Get.find();
  HomeControllor homeControllor = Get.put(HomeControllor());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'.tr),
        centerTitle: true,
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         homeControllor.pieData!.map((e) => print(e.yData)).toList();
        //       },
        //       icon: Icon(Icons.car_crash))
        // ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 150.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 35.h,
              ),
              Center(
                  child: Text(
                'balance'.tr,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              )),

              GetBuilder(
                init: HomeControllor(),
                builder: (controllor) {
                  return Center(
                      child: Text(
                          homeControllor.totalSalary == null
                              ? '0'
                              : '${(homeControllor.totalSalary!) - (homeControllor.totalExpenses!)} ${mainControllor.currency!}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)));
                },
              ),
              SizedBox(
                height: 50.h,
              ),
              // const Spacer(),
              GetBuilder(
                  init: HomeControllor(),
                  builder: (controllor) {
                    return homeControllor.pieData!.isEmpty
                        ? Container()
                        : PieChart(
                            pieData: homeControllor.pieData,
                          );
                  }),

              const Spacer(),
              Padding(
                padding: const EdgeInsetsDirectional.all(8.0),
                child: FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (builder) {
                          return Padding(
                              padding: EdgeInsetsDirectional.only(
                                  bottom: 200.h, start: 10.w),
                              child: GetBuilder(
                                  init: HomeControllor(),
                                  builder: (controllor) {
                                    return Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        AddCategoryRowWidget(
                                          controller: catControllor,
                                          hintText: 'Category'.tr,
                                          titleFaild: 'add'.tr + 'Category'.tr,
                                          sureButtonFunction: () {
                                            homeControllor.insertCategory(
                                                Category(
                                                    name: catControllor!.text));
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        AddCategoryRowWidget(
                                          controller: expControllor,
                                          hintText: 'Income'.tr,
                                          titleFaild: 'add'.tr + 'Income'.tr,
                                          sureButtonFunction: () {
                                            homeControllor.insertSalary(
                                                double.parse(
                                                    expControllor!.text));
                                            homeControllor.getSalary();
                                            print(
                                                "${homeControllor.totalSalary}");
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        AddExpensesRowWidget(
                                          sureButtonFun: () {
                                            homeControllor.insertDetailsExpenses(
                                                DetailExpenses(
                                                    name: homeControllor
                                                        .selectCategory!.name,
                                                    price: double.parse(
                                                        amountControllor!.text),
                                                    date: homeControllor.date,
                                                    time: homeControllor.time));
                                            homeControllor.insertExpenses(
                                                Expenses(
                                                    category_id: homeControllor
                                                        .selectCategory!.id,
                                                    price: double.parse(
                                                        amountControllor!
                                                            .text)));
                                            homeControllor.getSalary();
                                            homeControllor.getTotalExpenses();
                                            Navigator.of(context).pop();
                                          },
                                          amountControllor: amountControllor,
                                          selectCategory:
                                              homeControllor.selectCategory,
                                          items: homeControllor.allCategory!
                                              .map((Category value) {
                                            return DropdownMenuItem<Category>(
                                              value: value,
                                              child: InkWell(
                                                child: Directionality(
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  child: Row(
                                                    children: [
                                                      Text(value.name ?? ''),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          onChangeFun: (newVal) {
                                            homeControllor.selectCategory =
                                                newVal;
                                          },
                                        ),
                                      ],
                                    );
                                  }));
                        });
                  },
                  child: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

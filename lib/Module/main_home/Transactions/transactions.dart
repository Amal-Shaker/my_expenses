import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_expenses/Module/main_home/Transactions/transaction_controllor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../main_controllor.dart';
import '../Home/home_controllor.dart';

class Transactions extends StatelessWidget {
  Transactions({super.key});

  MainControllor mainControllor = Get.find();
  TransactionControllor transactionControllor =
      Get.put(TransactionControllor());
  HomeControllor homeControllor = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          excludeHeaderSemantics: false,
          title: Text('transactions'.tr),
          centerTitle: true,
        ),
        body: GetBuilder(
            init: TransactionControllor(),
            builder: (controllor) {
              return Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text(
                          'الراتب',
                        ),
                        //   subtitle: Text('$date \n $time'),
                        trailing: Text(
                          homeControllor.totalSalary == null
                              ? '0'
                              : '${homeControllor.totalSalary!}',
                          style: const TextStyle(color: Colors.green),
                        ),
                      ),
                      const Divider(
                        thickness: 0,
                        indent: 15,
                        endIndent: 15,
                      ),
                      homeControllor.detailExpenses!.isEmpty
                          ? Container()
                          : Container(
                              height: 600.h,
                              child: ListView.builder(
                                  itemCount:
                                      homeControllor.detailExpenses!.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        ListTile(
                                          title: Padding(
                                            padding: EdgeInsetsDirectional.only(
                                                bottom: 8.h),
                                            child: Text(
                                              '${homeControllor.detailExpenses![index].name}',
                                            ),
                                          ),
                                          subtitle: Text(
                                            '${homeControllor.detailExpenses![index].date}  ${homeControllor.detailExpenses![index].time}',
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                          trailing: Text(
                                            '${homeControllor.detailExpenses![index].price}',
                                            style: const TextStyle(
                                                color: Colors.red),
                                          ),
                                        ),
                                        const Divider(
                                          thickness: 0,
                                          indent: 15,
                                          endIndent: 15,
                                        ),
                                      ],
                                    );
                                  }),
                            )
                    ],
                  ));
            }));
  }
}

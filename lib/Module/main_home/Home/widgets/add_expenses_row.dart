import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Model/category.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddExpensesRowWidget extends StatelessWidget {
  AddExpensesRowWidget(
      {this.onChangeFun,
      this.items,
      this.selectCategory,
      this.amountControllor,
      this.sureButtonFun});
  Function(Category?)? onChangeFun;
  List<DropdownMenuItem<Category>>? items;
  Category? selectCategory;
  TextEditingController? amountControllor;
  Function()? sureButtonFun;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.shopping_cart,
            color: Colors.black,
          ),
        ),
        SizedBox(
          width: 9.w,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.white),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Material(
                      color: Colors.transparent,
                      child: Center(
                        child: Container(
                          padding: const EdgeInsetsDirectional.all(10),
                          width: 250.w,
                          height: 200.h,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.r)),
                          child: Column(
                            children: [
                              TextField(
                                controller: amountControllor,
                                decoration: InputDecoration(
                                    hintTextDirection: TextDirection.rtl,
                                    hintText: 'amount'.tr),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 3.w),
                                child: DropdownButton<Category>(
                                  isExpanded: true,
                                  value: selectCategory,
                                  iconEnabledColor: Colors.black,
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                  ),
                                  onChanged: onChangeFun,
                                  items: items,
                                ),
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.white),
                                      onPressed: sureButtonFun,
                                      child: Text(
                                        'sure'.tr,
                                        style: TextStyle(color: Colors.black),
                                      )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.white),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('cancel'.tr,
                                          style:
                                              TextStyle(color: Colors.black)))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            },
            child: Text(
              'add'.tr + 'Expenses'.tr,
              style: TextStyle(color: Colors.black),
            ))
      ],
    );
  }
}

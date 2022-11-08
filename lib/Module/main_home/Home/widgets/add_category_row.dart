import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCategoryRowWidget extends StatelessWidget {
  AddCategoryRowWidget(
      {this.controller,
      this.hintText,
      this.sureButtonFunction,
      this.titleFaild});
  TextEditingController? controller;
  String? hintText;
  Function()? sureButtonFunction;
  String? titleFaild;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.add,
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
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              TextField(
                                controller: controller,
                                decoration: InputDecoration(
                                    hintTextDirection: TextDirection.rtl,
                                    hintText: '$hintText'),
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.white),
                                      onPressed: sureButtonFunction,
                                      child: Text(
                                        'sure'.tr,
                                        style: const TextStyle(
                                            color: Colors.black),
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
                                          style: const TextStyle(
                                              color: Colors.black)))
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
              '$titleFaild',
              style: TextStyle(color: Colors.black),
            ))
      ],
    );
  }
}

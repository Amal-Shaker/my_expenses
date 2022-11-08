import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_expenses/main_controllor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Settings extends StatelessWidget {
  Settings({super.key});

  MainControllor mainControllor = Get.find();
  TextEditingController currencycontrollor = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: Text('setting'.tr),
            centerTitle: true,
          ),
          body: GetBuilder(
              init: MainControllor(),
              builder: (controllor) {
                return ListView(
                  children: [
                    InkWell(
                      onTap: () {
                        mainControllor.convertToDark();
                      },
                      child: ListTile(
                        leading: mainControllor.isDark
                            ? const Icon(Icons.light_mode_outlined)
                            : const Icon(Icons.dark_mode),
                        title: Text(mainControllor.isDark
                            ? 'lightMode'.tr
                            : 'darkMode'.tr),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Material(
                                color: Colors.transparent,
                                child: Center(
                                  child: Container(
                                    padding:
                                        const EdgeInsetsDirectional.all(10),
                                    width: 250.w,
                                    height: 200.h,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15.r)),
                                    child: Column(
                                      children: [
                                        TextField(
                                          controller: currencycontrollor,
                                          decoration: InputDecoration(
                                              hintTextDirection:
                                                  TextDirection.rtl,
                                              hintText: 'currency'.tr),
                                        ),
                                        const Spacer(),
                                        Row(
                                          children: [
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.white),
                                                onPressed: () {
                                                  mainControllor.addCurrency(
                                                      currencycontrollor.text);
                                                  mainControllor.getCurrency();
                                                  currencycontrollor.clear();
                                                  Navigator.of(context).pop();
                                                },
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
                      child: ListTile(
                        leading: const Icon(Icons.monetization_on),
                        title: Text('addCurrency'.tr),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        mainControllor.convertLanguage();
                        Get.updateLocale(mainControllor.l);
                      },
                      child: ListTile(
                        leading: const Icon(Icons.language),
                        title: Text('language'.tr),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.info_outline),
                      title: Text('aboutApp'.tr),
                    ),
                  ],
                );
              })),
    );
  }
}

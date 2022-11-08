import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'App/application.dart';
import 'Localization/language.dart';
import 'Module/main_home/main_home.dart';
import 'main_controllor.dart';

void main() async {
  await Application.intApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  MainControllor mainControllor = Get.put(MainControllor());

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetBuilder(
            init: MainControllor(),
            builder: (controllor) {
              return GetMaterialApp(
                translations: Language(),
                locale: Get.deviceLocale,
                fallbackLocale: const Locale('en', 'US'),
                debugShowCheckedModeBanner: false,
                title: 'First Method',
                theme: mainControllor.isDark
                    ? ThemeData.dark()
                    : ThemeData.light(),
                home: child,
              );
            });
      },
      child: MainHomeScreen(),
    );
  }
}

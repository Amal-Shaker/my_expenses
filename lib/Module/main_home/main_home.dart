import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main_controllor.dart';
import 'Home/home.dart';
import 'Settings/settings.dart';
import 'Transactions/transactions.dart';

class MainHomeScreen extends StatefulWidget {
  MainHomeScreen({super.key});
  static List<Widget> widgetOption = [Home(), Transactions(), Settings()];
  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
  MainControllor mainControllor = Get.find();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _selectedIndex = 0;
  //New
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainHomeScreen.widgetOption.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
        unselectedLabelStyle: TextStyle(fontSize: 13),
        selectedItemColor: widget.mainControllor.isDark
            ? const Color(0xff95989C)
            : const Color(0xff121311),
        unselectedItemColor: widget.mainControllor.isDark
            ? const Color(0xff121311)
            : const Color(0xff95989C),
        //backgroundColor: Colors.grey[100],
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'home'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.monetization_on),
            label: 'transactions'.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: 'setting'.tr,
          ),
        ],
      ),
    );
  }
}

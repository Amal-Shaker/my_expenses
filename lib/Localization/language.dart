import 'package:get/get.dart';
import 'package:my_expenses/Module/main_home/Transactions/transactions.dart';

class Language extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar_AR': {
          'setting': 'الاعدادات',
          'transactions': 'المعاملات',
          'home': 'الرئيسية',
          'balance': 'رصيدي',
          'myexpenses': 'مصاريفي',
          'Category': ' فئة',
          'Income': 'دخل',
          'Expenses': ' مصروف',
          'add': 'اضافة',
          'amount': 'المبلغ',
          'sure': 'تأكيد',
          'cancel': 'الغاء',
          'darkMode': 'تحويل للوضع الليلي',
          'lightMode': 'تحويل للوضع العادي',
          'addCurrency': 'ادخل العملة',
          'currency': 'العملة',
          'language': 'اللغة',
          'aboutApp': 'عن التطبيق',
        },
        'en_US': {
          'setting': 'Settings',
          'transactions': 'Transactions',
          'home': 'Home',
          'balance': 'My Balance',
          'myexpenses': 'My Expenses',
          'Category': ' category',
          'Income': ' income',
          'Expenses': ' expenses',
          'add': 'Add',
          'amount': 'The amount',
          'sure': 'Sure',
          'cancel': 'Cancel',
          'darkMode': 'Convert to Dark mode',
          'lightMode': 'Convert to Light mode',
          'addCurrency': 'Enter your Currency',
          'currency': 'Currency',
          'language': 'Language',
          'aboutApp': 'About The App',
        },
      };
}

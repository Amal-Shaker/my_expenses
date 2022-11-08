import 'package:my_expenses/Model/category.dart';
import 'package:my_expenses/Model/detail_expenses.dart';
import 'package:my_expenses/Model/expenses.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  //DbHelper._();
  static var instance = DbHelper();

  Database? database;

  static const String dbName = 'wallet.db';
  static const String tableName1 = 'category';
  static const String tableName2 = 'expenses';
  static const String tableName3 = 'expensesDetails';
  String id = 'id';
  String name = 'name';
  String price = 'price';
  String category_id = 'category_id';
  String date = 'date';
  String time = 'time';

  intDatabase() async {
    database = await getDatabaseConnection();
  }

  Future<Database> getDatabaseConnection() async {
    Database database = await openDatabase(
      join(await getDatabasesPath(), '$dbName'),
      version: 1,
      onCreate: (db, v) {
        db.execute(
            '''CREATE TABLE $tableName1 ($id INTEGER PRIMARY KEY AUTOINCREMENT , $name TEXT)''');

        db.execute(
            '''CREATE TABLE $tableName2 ($id INTEGER PRIMARY KEY AUTOINCREMENT , $category_id INTEGER REFERENCES $tableName1($id),$price DOUBLE)''');
        db.execute(
            '''CREATE TABLE $tableName3 ($id INTEGER PRIMARY KEY AUTOINCREMENT , $name TEXT,$price DOUBLE, $date TEXT, $time TEXT)''');
      },
      onOpen: (db) => print('DB is opened'),
    );

    return database;
  }

  insertCategory(Category category) async {
    int numRaw = await database!.insert(tableName1, category.toJson());
    print(numRaw);
  }

  insertExpenses(Expenses expenses) async {
    int numRaw = await database!.insert(tableName2, expenses.toJson());
    print(numRaw);
  }

  insertExpensesDetails(DetailExpenses detailsexpenses) async {
    int numRaw = await database!.insert(tableName3, detailsexpenses.toJson());
    print(numRaw);
  }

  Future<List<Category>> getAllCategory() async {
    List<Map<String, Object?>> results = await database!.query(tableName1);
    List<Category>? category = results.map((e) {
      return Category.fromJson(e);
    }).toList();
    return category;
  }

  Future<double> getTotalExpenses() async {
    double total = 0;

    List<Map<String, Object?>> results = await database!.query(tableName2);
    results.map((e) {
      total = total + Expenses.fromJson(e).price!;
    }).toList();
    return total;
  }

  Future<List<Expenses>> getAllExpenses() async {
    List<Map<String, Object?>> results = await database!.query(tableName2);
    List<Expenses>? expenses = results.map((e) {
      return Expenses.fromJson(e);
    }).toList();
    return expenses;
  }

  Future<List<DetailExpenses>> getAllDetailsExpenses() async {
    List<Map<String, Object?>> results = await database!.query(tableName3);
    List<DetailExpenses>? detailsexpenses = results.map((e) {
      return DetailExpenses.fromJson(e);
    }).toList();
    return detailsexpenses;
  }

  updateExpenses(Expenses expenses) async {
    await database!.update(tableName2, expenses.toJson(),
        where: 'id=?', whereArgs: [expenses.id]);
  }

  Future<Category> getCategoryById(int? id) async {
    List<Map<String, Object?>> results =
        await database!.query(tableName1, where: 'id=?', whereArgs: [id]);
    Category category = Category.fromJson(results[0]);

    return category;
  }

  // insertFav(Currencies currencies) async {
  //   int numRaw = await database!.insert(tableName, currencies.toJson());
  //   print(numRaw);
  // }

  // insertNews(News news) async {
  //   int numRaw = await database!.insert(tableName2, news.toJson());
  //   print(numRaw);
  // }

  // Future<List<Currencies>> getAllCurrencies() async {
  //   List<Map<String, Object?>> results = await database!.query(tableName);
  //   List<Currencies>? currencies = results.map((e) {
  //     return Currencies.fromJson(e);
  //   }).toList();
  //   return currencies;
  // }

  // Future<List<News>> getAllNews() async {
  //   List<Map<String, Object?>> results = await database!.query(tableName2);
  //   List<News>? news = results.map((e) {
  //     return News.fromJson(e);
  //   }).toList();
  //   return news;
  // }
}

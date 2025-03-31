import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;

import '../../../common/constants.dart';

class DBHelper{
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return _database!;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'Daily_Sales_Record.db');
    var db = openDatabase(path,
        version: 1, onCreate: _onCreate, onConfigure: _onConfigure, onOpen: _onOpen);
    return db;
  }

 // DBHelper.internal();

  _onCreate(Database db, int version) async{
    // String categoryTable =
    // '''CREATE TABLE ${TableCategory.tableName}(${TableCategory.id} INTEGER PRIMARY KEY AUTOINCREMENT, ${TableCategory.title} TEXT NOT NULL, ${TableCategory.description} TEXT, ${TableCategory.photo} TEXT )''';
    // String productTable =
    //     '''CREATE TABLE ${TableProduct.tableName}(${TableProduct.id} INTEGER PRIMARY KEY AUTOINCREMENT, ${TableProduct.title} TEXT NOT NULL, ${TableProduct.category} TEXT NOT NULL, ${TableProduct.description} TEXT, ${TableProduct.wholeSalePrice} REAL, ${TableProduct.retailPrice} REAL, ${TableProduct.discount} REAL, ${TableProduct.tax} REAL, ${TableProduct.quantity} REAL, ${TableProduct.quantityUnit} INTEGER, ${TableProduct.photo} TEXT, FOREIGN KEY (${TableProduct.id}) REFERENCES ${TableCategory.tableName} (${TableCategory.id}) ON UPDATE CASCADE ON DELETE CASCADE )''';
    // String customerTable =
    //     '''CREATE TABLE ${TableCustomer.tableName}(${TableCustomer.id} INTEGER PRIMARY KEY AUTOINCREMENT, ${TableCustomer.name} TEXT NOT NULL, ${TableCustomer.email} TEXT, ${TableCustomer.phoneNumber} TEXT, ${TableCustomer.address} TEXT, ${TableCustomer.category} TEXT, ${TableCustomer.balance} REAL NOT NULL, ${TableCustomer.photo} TEXT, FOREIGN KEY (${TableCustomer.category}) REFERENCES ${TableCategory.tableName}(${TableCategory.title}) ON UPDATE CASCADE ON DELETE CASCADE )''';
    //

    String categoryTable = '''
CREATE TABLE ${TableCategory.tableName}(
  ${TableCategory.id} INTEGER PRIMARY KEY AUTOINCREMENT, 
  ${TableCategory.title} TEXT NOT NULL, 
  ${TableCategory.description} TEXT, 
  ${TableCategory.photo} TEXT
)
''';

    String unitTable = '''
CREATE TABLE ${TableUnitType.tableName}(
  ${TableUnitType.id} INTEGER PRIMARY KEY AUTOINCREMENT,
  ${TableUnitType.title} TEXT NOT NULL, 
  ${TableUnitType.variantName} TEXT,
  ${TableUnitType.variantValue} REAL
)
''';

    String productTable = '''
CREATE TABLE ${TableProduct.tableName}(
  ${TableProduct.id} INTEGER PRIMARY KEY AUTOINCREMENT, 
  ${TableProduct.title} TEXT NOT NULL, 
  ${TableProduct.categoryId} INTEGER NOT NULL,
  ${TableProduct.description} TEXT, 
  ${TableProduct.wholeSalePrice} REAL, 
  ${TableProduct.retailPrice} REAL, 
  ${TableProduct.discount} REAL, 
  ${TableProduct.tax} REAL, 
  ${TableProduct.quantity} REAL, 
  ${TableProduct.quantityUnit} TEXT,
  ${TableProduct.photo} TEXT, 
  FOREIGN KEY (${TableProduct.categoryId}) REFERENCES ${TableCategory.tableName} (${TableCategory.id}) ON UPDATE CASCADE ON DELETE CASCADE
)
''';

    String customerTable = '''
CREATE TABLE ${TableCustomer.tableName}(
  ${TableCustomer.id} INTEGER PRIMARY KEY AUTOINCREMENT, 
  ${TableCustomer.name} TEXT NOT NULL, 
  ${TableCustomer.email} TEXT, 
  ${TableCustomer.phoneNumber} TEXT, 
  ${TableCustomer.address} TEXT, 
  ${TableCustomer.categoryId} INTEGER NOT NULL, 
  ${TableCustomer.balance} REAL NOT NULL, 
  ${TableCustomer.photo} TEXT, 
  FOREIGN KEY (${TableCustomer.categoryId}) REFERENCES ${TableCategory.tableName}(${TableCategory.id}) ON UPDATE CASCADE ON DELETE CASCADE
)
''';


    String transactionTable =
    '''CREATE TABLE ${TableTransaction.tableName}(
        ${TableTransaction.id} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${TableTransaction.name} TEXT,
        ${TableTransaction.photo} TEXT,
        ${TableTransaction.paid} REAL,
        ${TableTransaction.due} REAL,
        ${TableTransaction.quantity} REAL,
        ${TableTransaction.customerId} INTEGER,
        ${TableTransaction.productId} INTEGER,
        FOREIGN KEY (${TableTransaction.customerId}) REFERENCES ${TableCustomer.tableName}(${TableCustomer.id}),
    FOREIGN KEY (${TableTransaction.productId}) REFERENCES ${TableProduct.tableName}(${TableProduct.id})
    ON UPDATE CASCADE
    ON DELETE CASCADE
    );
    ''';
    await db.execute(categoryTable);
    await db.execute(unitTable);
    await db.execute(customerTable);
    await db.execute(productTable);
    await db.execute(transactionTable);
  }

  _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  _onOpen(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

}

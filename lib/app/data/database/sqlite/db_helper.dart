import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;

import '../../utilities/constants.dart';

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
    String path = join(documentDirectory.path, 'product.db');
    var db = openDatabase(path,
        version: 1, onCreate: _onCreate, onConfigure: _onConfigure, onOpen: _onOpen);
    return db;
  }

 // DBHelper.internal();

  _onCreate(Database db, int version) async{
    String categoryTable =
    '''CREATE TABLE ${TableCategory.tableName}(${TableCategory.id} INTEGER PRIMARY KEY AUTOINCREMENT, ${TableCategory.title} TEXT NOT NULL UNIQUE, ${TableCategory.description} TEXT, ${TableCategory.photoUrl} TEXT )''';
    String productTable =
        '''CREATE TABLE ${TableProduct.tableName}(${TableProduct.id} INTEGER PRIMARY KEY AUTOINCREMENT, ${TableProduct.title} TEXT NOT NULL, ${TableProduct.category} TEXT NOT NULL, ${TableProduct.description} TEXT, ${TableProduct.wholeSalePrice} REAL, ${TableProduct.retailPrice} REAL, ${TableProduct.discount} REAL, ${TableProduct.tax} REAL, ${TableProduct.quantity} REAL, ${TableProduct.quantityUnit} INTEGER, ${TableProduct.photoUrl} TEXT, FOREIGN KEY (${TableProduct.category}) REFERENCES ${TableCategory.tableName} (${TableCategory.title}) ON UPDATE CASCADE ON DELETE CASCADE )''';
        // '''CREATE TABLE ${TableProduct.tableName}(${TableProduct.id} INTEGER PRIMARY KEY AUTOINCREMENT, ${TableProduct.title} TEXT NOT NULL, ${TableProduct.category} TEXT NOT NULL, ${TableProduct.description} TEXT, ${TableProduct.wholeSalePrice} REAL, ${TableProduct.retailPrice} REAL, ${TableProduct.discount} REAL, ${TableProduct.tax} REAL, ${TableProduct.quantity} REAL, ${TableProduct.quantityUnit} INTEGER, ${TableProduct.photoUrl} TEXT)''';
    String customerTable =
        '''CREATE TABLE ${TableCustomer.tableName}(${TableCustomer.id} INTEGER PRIMARY KEY AUTOINCREMENT, ${TableCustomer.email} TEXT, ${TableCustomer.phoneNumber} TEXT, ${TableCustomer.address} TEXT, ${TableCustomer.category} TEXT, ${TableCustomer.debit} REAL NOT NULL, ${TableCustomer.credit} REAL NOT NULL, ${TableCustomer.balance} REAL NOT NULL, ${TableCustomer.photoUrl} TEXT, FOREIGN KEY (${TableCustomer.category}) REFERENCES ${TableCategory.tableName}(${TableCategory.title})''';
    String transactionTable =
        '''CREATE TABLE ${TableTransaction.tableName}(${TableTransaction.id} INTEGER PRIMARY KEY AUTOINCREMENT, ${TableTransaction.name} TEXT, ${TableTransaction.paid} REAL, ${TableTransaction.customerId} INTEGER, ${TableTransaction.productId} INTEGER, FOREIGN KEY (${TableTransaction.customerId}) REFERENCE ${TableCustomer.tableName}(${TableCustomer.id}, FOREIGN KEY (${TableTransaction.productId}) REFERENCE ${TableCustomer.tableName}(${TableProduct.id} )''';
   String demo1 = '''
          CREATE TABLE table1 (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT
          )
        ''';
   String demo2 = '''
          CREATE TABLE table2 (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            data TEXT,
            table1_id INTEGER,
            FOREIGN KEY (table1_id) REFERENCES table1 (id)
          )
        ''';
    await db.execute(categoryTable);
    await db.execute(productTable);
    await db.execute(demo1);
    await db.execute(demo2);
  //  await db.execute(customerTable);
   // await db.execute(transactionTable);
  }

  _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  _onOpen(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

}

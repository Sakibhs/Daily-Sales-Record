
import 'package:daily_sales_record/app/data/models/category.dart';

import '../database/sqlite/db_helper.dart';
import '../models/customer.dart';
import '../utilities/constants.dart';

class CustomerRepo{
  DBHelper dbHelper = DBHelper();

  Future<int> add(Customer customer, Category category) async {
    var dbClient = await dbHelper.database;
    return await dbClient.insert(TableCustomer.tableName, customer.toMap());
  }

  Future<int> update(Customer customer) async {
    var dbClient = await dbHelper.database;
    return await dbClient.update(TableCustomer.tableName, customer.toMap(), where: '${TableCustomer.id} = ?',
        whereArgs: [customer.id]);
  }

  Future<int> deleteCustomer(int id) async {
    var dbClient = await dbHelper.database;
    return await dbClient.delete(TableCustomer.tableName, where: '${TableCustomer.id} = ?',
        whereArgs: [id]);
  }

  Future<List<Customer>> getAllCustomer() async {
    var dbClient = await dbHelper.database;
    List<Map> maps = await dbClient.query(TableCustomer.tableName, columns: [(TableCustomer.id),TableCustomer.name, TableCustomer.category, TableCustomer.photoUrl, TableCustomer.email, TableCustomer.phoneNumber, TableCustomer.address, TableCustomer.debit, TableCustomer.credit, TableCustomer.balance]);
    List<Customer> customerList = [];
    for(int i = 0; i < maps.length; i++){
      customerList.add(Customer.fromMap(maps[i]));
    }
    return customerList;
  }

  deleteAllCustomers() async {
    var dbClient = await dbHelper.database;
    return await dbClient.delete(TableCustomer.tableName);
  }

}
import '../database/sqlite/db_helper.dart';
import '../models/category.dart';
import '../models/customer.dart';
import '../../common/constants.dart';

class CustomerRepo{
  DBHelper dbHelper = DBHelper();

  Future<void> add(Customer customer, Category category) async {
    var dbClient = await dbHelper.database;
    //  await dbClient.insert(TableProduct.tableName, product.toMap());

    await dbClient.transaction((txn) async {
      int table1Id = await txn.insert(TableCategory.tableName, category.toMap());
      customer.categoryId = table1Id;
      //await txn.insert('table2', {'data': 'Data 1', 'table1_id': table1Id});
      await txn.insert(TableCustomer.tableName, customer.toMap());
    });
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
    List<Map> maps = await dbClient.query(TableCustomer.tableName, columns: [(TableCustomer.id),TableCustomer.name, TableCustomer.categoryId, TableCustomer.photo, TableCustomer.email, TableCustomer.phoneNumber, TableCustomer.address, TableCustomer.balance]);
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
import '../database/sqlite/db_helper.dart';
import '../models/transaction.dart';
import '../utilities/constants.dart';

class TransactionRepository{
  DBHelper dbHelper = DBHelper();

  Future<int> add(Transaction transaction) async {
    var dbClient = await dbHelper.database;
    return await dbClient.insert(TableTransaction.tableName, transaction.toMap());
  }

  Future<int> update(Transaction transaction) async {
    var dbClient = await dbHelper.database;
    return await dbClient.update(TableTransaction.tableName, transaction.toMap(), where: '${TableTransaction.id} = ?',
        whereArgs: [transaction.transactionId]);
  }

  Future<int> deleteProduct(int id) async {
    var dbClient = await dbHelper.database;
    return await dbClient.delete(TableTransaction.tableName, where: '${TableTransaction.id} = ?',
        whereArgs: [id]);
  }

  Future<List<Transaction>> getAllTransaction() async {
    var dbClient = await dbHelper.database;
    List<Map> maps = await dbClient.query(TableTransaction.tableName, columns: [(TableTransaction.id),TableTransaction.name,
      TableTransaction.paid, TableTransaction.customerId, TableTransaction.productId]);
    List<Transaction> transactionList = [];
    for(int i = 0; i<maps.length; i++){
      transactionList.add(Transaction.fromMap(maps[i]));
    }
    return transactionList;
  }
}
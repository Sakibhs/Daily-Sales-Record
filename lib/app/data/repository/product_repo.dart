
import '../database/sqlite/db_helper.dart';
import '../models/category.dart';
import '../models/product.dart';
import '../utilities/constants.dart';

class ProductRepository{
  DBHelper dbHelper = DBHelper();

  Future<void> add(Product product, Category category) async {
    var dbClient = await dbHelper.database;
  //  await dbClient.insert(TableProduct.tableName, product.toMap());

    await dbClient.transaction((txn) async {
      int table1Id = await txn.insert(TableCategory.tableName, category.toMap());
     //await txn.insert('table2', {'data': 'Data 1', 'table1_id': table1Id});
       await txn.insert(TableProduct.tableName, product.toMap());
    });

  }

  Future<void> insertData() async {
    var dbClient = await dbHelper.database;
    await dbClient.transaction((txn) async {
      int table1Id = await txn.rawInsert('INSERT INTO table1(name) VALUES("John Doe")');
      await txn.rawInsert('INSERT INTO table2(data, table1_id) VALUES("Data 1", $table1Id)');
    });
  }

  Future<int> update(Product product) async {
    var dbClient = await dbHelper.database;
    return await dbClient.update(TableProduct.tableName, product.toMap(), where: '${TableProduct.id} = ?',
    whereArgs: [product.id]);
  }

  Future<int> deleteProduct(int id) async {
    var dbClient = await dbHelper.database;
    return await dbClient.delete(TableProduct.tableName, where: '${TableProduct.id} = ?',
    whereArgs: [id]);
  }

  Future<List<Product>> getAllProduct() async {
    var dbClient = await dbHelper.database;
    List<Map> maps = await dbClient.query(TableProduct.tableName, columns: [(TableProduct.id),TableProduct.title,
    TableProduct.category, TableProduct.description, TableProduct.wholeSalePrice, TableProduct.retailPrice, TableProduct.discount,
    TableProduct.tax, TableProduct.quantity, TableProduct.quantityUnit, TableProduct.photoUrl]);
    List<Product> productList = [];
    for(int i = 0; i<maps.length; i++){
      productList.add(Product.fromMap(maps[i]));
    }
    return productList;
  }
}
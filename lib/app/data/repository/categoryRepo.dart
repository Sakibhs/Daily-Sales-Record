import 'package:sqflite/sqflite.dart';

import '../database/sqlite/db_helper.dart';
import '../models/category.dart';
import '../utilities/constants.dart';

class CategoryRepo{
  DBHelper dbHelper = DBHelper();

Future<int> add(Category category) async {
var dbClient = await dbHelper.database;
//return await dbClient.insert(conflictAlgorithm: ConflictAlgorithm.replace, TableCategory.tableName, category.toMap());
return await dbClient.insert(TableCategory.tableName, category.toMap());
}

  Future<int> update(Category category) async {
    var dbClient = await dbHelper.database;
    return await dbClient.update(TableCategory.tableName, category.toMap(), where: '${TableCategory.id} = ?',
        whereArgs: [category.id]);
  }

  Future<int> deleteCategory(int id) async {
    var dbClient = await dbHelper.database;
    return await dbClient.delete(TableCategory.tableName, where: '${TableCategory.id} = ?',
        whereArgs: [id]);
  }

  Future<List<Category>> getAllCategory() async {
    var dbClient = await dbHelper.database;
    List<Map> maps = await dbClient.query(TableCategory.tableName, columns: [(TableCategory.id),TableCategory.title, TableCategory.description, TableCategory.photoUrl]);
    List<Category> categoryList = [];
    for(int i = 0; i<maps.length; i++){
      print("SakibMou: ${Category.fromMap(maps[i]).photoUrl}");
      print("SakibMou: ${Category.fromMap(maps[i]).title}");
      print("SakibMou: ${Category.fromMap(maps[i]).description}");
      categoryList.add(Category.fromMap(maps[i]));
    }
    return categoryList;
  }

}
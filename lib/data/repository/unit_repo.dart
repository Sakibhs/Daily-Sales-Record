import 'package:daily_sales_record/data/models/unit_type_model.dart';
import 'package:sqflite/sqflite.dart';

import '../database/sqlite/db_helper.dart';
import '../models/category.dart';
import '../../common/constants.dart';

class UnitRepo{
  DBHelper dbHelper = DBHelper();

  Future<int> add(UnitTypeModel model) async {
    var dbClient = await dbHelper.database;
    return await dbClient.insert(TableUnitType.tableName, model.toMap());
  }

  Future<int> update(UnitTypeModel model) async {
    var dbClient = await dbHelper.database;
    return await dbClient.update(TableUnitType.tableName, model.toMap(), where: '${TableUnitType.id} = ?',
        whereArgs: [model.id]);
  }

  Future<int> deleteCategory(int id) async {
    var dbClient = await dbHelper.database;
    return await dbClient.delete(TableUnitType.tableName, where: '${TableUnitType.id} = ?',
        whereArgs: [id]);
  }

  Future<List<UnitTypeModel>> getAllCategory() async {
    var dbClient = await dbHelper.database;
    List<Map> maps = await dbClient.query(TableUnitType.tableName, columns: [(TableUnitType.id),TableUnitType.title, TableUnitType.variantName, TableUnitType.variantValue]);
    List<UnitTypeModel> unitList = [];
    for(int i = 0; i < maps.length; i++){
      unitList.add(UnitTypeModel.fromMap(maps[i]));
    }
    return unitList;
  }

}
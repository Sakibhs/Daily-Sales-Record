import 'dart:collection';

import 'package:daily_sales_record/data/models/unit_type_model.dart';
import 'package:daily_sales_record/data/repository/unit_repo.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AddUnitController extends GetxController {
  //TODO: Implement AddUnitController
  var units = <UnitTypeModel>[].obs;
  TextEditingController unitTypeTitle = TextEditingController();
  TextEditingController variantName = TextEditingController();
  TextEditingController variantValue = TextEditingController();
  UnitRepo unitRepo = UnitRepo();
  var type = "Weight".obs;
  var menuItems = <DropdownMenuItem>[].obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    UnitRepo repo = UnitRepo();
    units.value = await repo.getAllCategory();
    print("Sakib Length: ${units.length}");
    // for(UnitTypeModel model in unitTemp){
    //   print("Sakib Checking Unit Type");
    //   units.add(model);
    // }
    List<String> unitTitles = [];
    for (var element in units) { unitTitles.add(element.title!);}
    unitTitles = unitTitles.toSet().toList();

    for(String unit in unitTitles){
      menuItems.add(DropdownMenuItem(
        value: unit,
        child: Text(unit ?? "Demo"),));
      print(unit);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}


  Future<void> addUnit() async {
    Map<String, dynamic> json = HashMap();
    if(unitTypeTitle.text.trim() != ""){
      json['unitTypeTitle'] = unitTypeTitle.text;
      json['variantName'] = variantName.text;
      json['variantValue'] = variantValue.text;
      await unitRepo.add(UnitTypeModel.fromMap(json));
     // categoryController.items.add(Category.fromMap(json));
      Get.back();
    }
    else{
      Fluttertoast.showToast(msg: "Title is empty!");
    }
  }

}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/category.dart';
import '../../../data/repository/categoryRepo.dart';
import '../../add_product/controllers/add_product_controller.dart';

class CategoryController extends GetxController {
  AddProductController addProductController = Get.put(AddProductController());
  TextEditingController textEditingController = TextEditingController(text: "");
  var selectedCategory = "".obs;
  var items = [].obs;
  CategoryRepo categoryRepo = CategoryRepo();
  @override
  Future<void> onInit() async {
    super.onInit();
    List<Category> categories = await categoryRepo.getAllCategory();
    for(Category category in categories){
      items.add(category);
    }
  }

}

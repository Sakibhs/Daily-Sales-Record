import 'dart:collection';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/models/category.dart';
import '../../../data/repository/categoryRepo.dart';
import '../../category/controllers/category_controller.dart';

class AddCategoryController extends GetxController {
  //TODO: Implement AddCategoryController
  String? filePath;
  Rx<File> file = File("").obs;
  ImagePicker image = ImagePicker();
  TextEditingController titleController = TextEditingController(text: "");
  TextEditingController descController = TextEditingController(text: "");
  CategoryController categoryController = Get.put(CategoryController());
  CategoryRepo categoryRepo = CategoryRepo();
  void getImage(bool isFromGallery) async {
    ImageSource imgSource;
    if(isFromGallery){
      imgSource = ImageSource.gallery;
    } else{
      imgSource = ImageSource.camera;
    }
    var imagePicking = await image.pickImage(source: imgSource);
    file.value = File(imagePicking!.path);
    filePath = imagePicking.path;
  }

  Future<void> addCategory() async {
    Map<dynamic, dynamic> json = HashMap();
    filePath ??= "";
    if(titleController.text.trim() != ""){
      json['categoryTitle'] = titleController.text;
      json['categoryDescription'] = descController.text;
      json['categoryPhotoUrl'] = filePath;
      await categoryRepo.add(Category.fromMap(json));
      //await categoryController.onInit();
      categoryController.items.add(Category.fromMap(json));
      Get.back();
    }
    else{
      Fluttertoast.showToast(msg: "Title is empty!");
    }
  }
}

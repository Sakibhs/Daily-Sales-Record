import 'dart:collection';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/models/category.dart';
import '../../../data/models/product.dart';
import '../../product/controllers/product_controller.dart';

class AddProductController extends GetxController {
  final userData = GetStorage();
  String? filePath;


  TextEditingController titleController = TextEditingController(text: ""),
      descriptionController = TextEditingController(text: ""),
      wholeSalePriceController = TextEditingController(text: "0.0"),
      retailPriceController = TextEditingController(text: "0.0"),
      discountController = TextEditingController(text: "0.0"),
      taxController = TextEditingController(text: "0.0"),
      quantityController = TextEditingController(text: "0.0"),
      quantityUnitController = TextEditingController(text: "1");
  var categoryController = TextEditingController(text : "None").obs;
  ProductController pageController = Get.put(ProductController());
  Rx<File> file = File("").obs;
  ImagePicker image = ImagePicker();
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

  void add(){
    filePath ??= "";
    Map<dynamic, dynamic> json = HashMap();
    json['id'] = -1;
    json['title'] = titleController.text;
    json['productCategory'] = categoryController.value.text;
    json['description'] = descriptionController.text;
    json['wprice'] = double.parse(wholeSalePriceController.text);
    json['rprice'] = double.parse(retailPriceController.text);
    json['discount'] = double.parse(discountController.text);
    json['tax'] = double.parse(taxController.text);
    json['quantity'] = double.parse(quantityController.text);
    json['quantityUnit'] = int.parse(quantityUnitController.text);
    json['photoUrl'] = filePath;
    Category? category;
    if(categoryController.value.text == "None") {
      category = Category(id: -1,
          title: "None",
          description: "",
          photoUrl: "");
    }
    pageController.addProduct(Product.fromMap(json), category!);
    pageController.getAllProduct();
    Get.back();
  }
}

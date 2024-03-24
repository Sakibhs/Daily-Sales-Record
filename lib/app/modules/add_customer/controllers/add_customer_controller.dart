import 'dart:collection';
import 'dart:io';

import 'package:daily_sales_record/app/data/models/customer.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/models/category.dart';
import '../../customer/controllers/customer_controller.dart';

class AddCustomerController extends GetxController {
  final userData = GetStorage();
  String? filePath;
  TextEditingController nameController = TextEditingController(text: ""),
      emailController = TextEditingController(text: ""),
      phoneNumberController = TextEditingController(text: "0.0"),
      balanceController = TextEditingController(text: "0.0"),
      addressController = TextEditingController(text: "0.0");
  var categoryController = TextEditingController(text : "None").obs;
  CustomerController customerController = Get.put(CustomerController());
  var balance = 0.0.obs;
  var isDebit = false.obs;
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
    json['name'] = nameController.text;
    json['category'] = categoryController.value.text;
    json['email'] = emailController.text;
    json['phoneNumber'] = double.parse(phoneNumberController.text);
    json['balance'] = balance.value;
    json['address'] = addressController.text;
    json['isDebit'] = isDebit.value;

    Category? category;
    if(categoryController.value.text == "None") {
      category = Category(id: -1,
          title: "None",
          description: "",
          photoUrl: "");
    }
    customerController.addCustomer(Customer.fromMap(json), category!);
    customerController.getAllCustomers();
    Get.back();
  }
}

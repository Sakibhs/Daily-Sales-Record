import 'dart:collection';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../data/models/category.dart';
import '../../../../data/models/customer.dart';
import '../../customer/controllers/customer_controller.dart';

class AddCustomerController extends GetxController {
  final userData = GetStorage();
  String? filePath;
  TextEditingController nameController = TextEditingController(text: "SAkib"),
      emailController = TextEditingController(text: "mds@gmail.com"),
      phoneNumberController = TextEditingController(text: "1123"),
      balanceController = TextEditingController(text: "2000"),
      addressController = TextEditingController(text: "sdf"),
     categoryTitleController = TextEditingController(text: "None");

  var selectedCategory = Rx<Category>(Category(title: "demo"));
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

  void add() async {
    filePath ??= "";
    print("After ISO");
    Map<dynamic, dynamic> json = HashMap();
    json['customerName'] = nameController.text;
    json['customerEmail'] = emailController.text;
    json['phoneNumber'] = phoneNumberController.text;
    json['balance'] = balance.value;
    json['address'] = addressController.text;
  //  json['isDebit'] = isDebit.value;

    customerController.addCustomer(Customer.fromMap(json), selectedCategory.value);
    customerController.getAllCustomers();
    Get.back();
  }
}




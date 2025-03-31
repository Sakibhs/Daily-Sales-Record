import 'dart:isolate';

import 'package:daily_sales_record/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/add_customer_controller.dart';

class AddCustomerView extends GetView<AddCustomerController> {
  String selectedCategory = "One";

  AddCustomerView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Customer'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        height: double.infinity,
        width: double.infinity,
        child: CustomScrollView(slivers: [
          SliverFillRemaining(
              hasScrollBody: false,
              child: Obx(
                    () => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        showAlertDialog(context);
                      },
                      child: IgnorePointer(
                        child: Container(
                          height: 150,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.black12),
                          width: 150,
                          child: controller.file.value.path == ""
                              ? const Icon(Icons.add_photo_alternate, size: 100)
                              : ClipOval(
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(48),
                              child: Image.file(
                                controller.file.value,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 50,
                      child: TextField(
                        onTap: () => controller.nameController.selection =
                            TextSelection(
                                baseOffset: 0,
                                extentOffset: controller
                                    .nameController.value.text.length),
                        controller: controller.nameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 12, right: 12),
                          labelText: "Name",
                          labelStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal),
                          enabledBorder: const OutlineInputBorder(
                            //  borderSide: BorderSide(color: Colors.teal),
                            // borderRadius: BorderRadius.all(Radius.circular(30.0))
                          ),
                          focusedBorder: const OutlineInputBorder(
                            // borderSide: BorderSide(color: Colors.blue),
                            //borderRadius: BorderRadius.all(Radius.circular(30.0))
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                      ),
                    ),
                    SizedBox(height: 12,),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: TextField(
                        onTap: () =>
                        controller.emailController.selection =
                            TextSelection(
                                baseOffset: 0,
                                extentOffset: controller
                                    .emailController
                                    .value
                                    .text
                                    .length),
                        controller: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        // controller: controller.enterPinController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 12, right: 12),
                          labelText: "Email",
                          labelStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal),
                          enabledBorder: const OutlineInputBorder(
                            //  borderSide: BorderSide(color: Colors.teal),
                            // borderRadius: BorderRadius.all(Radius.circular(30.0))
                          ),
                          focusedBorder: const OutlineInputBorder(
                            // borderSide: BorderSide(color: Colors.blue),
                            //borderRadius: BorderRadius.all(Radius.circular(30.0))
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                      ),
                    ),
                    SizedBox(height: 12,),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 50,
                      child: TextField(
                        onTap: () =>
                        controller.phoneNumberController.selection =
                            TextSelection(
                                baseOffset: 0,
                                extentOffset: controller
                                    .phoneNumberController
                                    .value
                                    .text
                                    .length),
                        controller: controller.phoneNumberController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 12, right: 12),
                          labelText: "Phone Number",
                          labelStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal),
                          enabledBorder: const OutlineInputBorder(
                            //  borderSide: BorderSide(color: Colors.teal),
                            // borderRadius: BorderRadius.all(Radius.circular(30.0))
                          ),
                          focusedBorder: const OutlineInputBorder(
                            // borderSide: BorderSide(color: Colors.blue),
                            //borderRadius: BorderRadius.all(Radius.circular(30.0))
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                      ),
                    ),
                    SizedBox(height: 12,),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 50,
                      child: TextField(
                        onTap: () =>
                        controller.balanceController.selection =
                            TextSelection(
                                baseOffset: 0,
                                extentOffset: controller
                                    .balanceController
                                    .value
                                    .text
                                    .length),
                        controller: controller.balanceController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 12, right: 12),
                          labelText: "Initial Balance",
                          labelStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal),
                          enabledBorder: const OutlineInputBorder(
                            //  borderSide: BorderSide(color: Colors.teal),
                            // borderRadius: BorderRadius.all(Radius.circular(30.0))
                          ),
                          focusedBorder: const OutlineInputBorder(
                            // borderSide: BorderSide(color: Colors.blue),
                            //borderRadius: BorderRadius.all(Radius.circular(30.0))
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                      ),
                    ),
                    SizedBox(height: 12,),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 50,
                      child: TextField(
                        onTap: () =>
                        controller.addressController.selection =
                            TextSelection(
                                baseOffset: 0,
                                extentOffset: controller
                                    .addressController
                                    .value
                                    .text
                                    .length),
                        controller: controller.addressController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 12, right: 12),
                          labelText: "Address",
                          labelStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal),
                          enabledBorder: const OutlineInputBorder(
                            //  borderSide: BorderSide(color: Colors.teal),
                            // borderRadius: BorderRadius.all(Radius.circular(30.0))
                          ),
                          focusedBorder: const OutlineInputBorder(
                            // borderSide: BorderSide(color: Colors.blue),
                            //borderRadius: BorderRadius.all(Radius.circular(30.0))
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                      ),
                    ),
                    SizedBox(height: 12,),
                    Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 50,
                        child: Obx(
                          () => TextField(
                              onTap: (){
                                FocusScope.of(context).requestFocus(FocusNode());
                                Get.toNamed(Routes.CATEGORY);
                              },
                            controller: controller.categoryTitleController..text = controller.selectedCategory.value.title?? "None",
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 12, right: 12),
                                labelText: "Category",
                                labelStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.teal),
                                enabledBorder: const OutlineInputBorder(
                                  //  borderSide: BorderSide(color: Colors.teal),
                                  // borderRadius: BorderRadius.all(Radius.circular(30.0))
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  // borderSide: BorderSide(color: Colors.blue),
                                  //borderRadius: BorderRadius.all(Radius.circular(30.0))
                                ),
                                filled: true,
                                fillColor: Colors.grey[200],
                              )
                          ),
                        )),
                    ElevatedButton(
                        onPressed: () async {
                          final receivePort = ReceivePort();
                          await Isolate.spawn(iso, receivePort.sendPort);
                          receivePort.listen((message) {
                            debugPrint('Sakib $message');
                          });
                          controller.add();
                        },
                        child: const Text('Add'))
                  ],
                ),
              ))
        ]),
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    Widget galleryButton = ElevatedButton(
      child: const Text("Gallery"),
      onPressed: () async {
        controller.getImage(true);
        Get.back(closeOverlays: true);
      },
    );

    Widget cameraButton = ElevatedButton(
      child: const Text("Camera"),
      onPressed: () {
        controller.getImage(false);
        Get.back(closeOverlays: true);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Pick Photo From"),
      // content: Text("This is my message."),
      actions: [cameraButton, galleryButton],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  }

    iso(SendPort sendPort) async {
     int value = 0;
      for(int i = 0; i < 100000000; i++){
    value++;
       if(value % 1000000 == 0) {
      print(i);
    }
  }
  //print('finished');
      sendPort.send(value);
}

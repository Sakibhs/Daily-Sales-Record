import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
   AddProductView({super.key});
  String selectedCategory = "One";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
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
                      margin: const EdgeInsets.only(top: 8.0),
                      child: TextField(
                        onTap: () => controller.titleController.selection =
                            TextSelection(
                                baseOffset: 0,
                                extentOffset: controller
                                    .titleController.value.text.length),
                        controller: controller.titleController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Title",
                          labelStyle: const TextStyle(
                              fontSize: 18,
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width /
                                (20.0 / 9.0),
                            // width: 200,
                            margin: const EdgeInsets.only(top: 8),
                            child: TextField(
                              onTap: () =>
                              controller.quantityController.selection =
                                  TextSelection(
                                      baseOffset: 0,
                                      extentOffset: controller
                                          .quantityController
                                          .value
                                          .text
                                          .length),
                              controller: controller.quantityController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              // controller: controller.enterPinController,
                              decoration: InputDecoration(
                                labelText: "Quantity",
                                labelStyle: const TextStyle(
                                    fontSize: 18,
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
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 20),
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            // width: 200,
                            margin: const EdgeInsets.only(top: 8),
                            child: TextField(
                              onTap: () =>
                              controller.quantityUnitController.selection =
                                  TextSelection(
                                      baseOffset: 0,
                                      extentOffset: controller
                                          .quantityUnitController
                                          .value
                                          .text
                                          .length),
                              controller: controller.quantityUnitController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                labelText: "Unit",
                                labelStyle: const TextStyle(
                                    fontSize: 18,
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
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      // width: 200,
                      margin: const EdgeInsets.only(top: 8),
                      child: TextField(
                        onTap: () =>
                        controller.retailPriceController.selection =
                            TextSelection(
                                baseOffset: 0,
                                extentOffset: controller
                                    .retailPriceController
                                    .value
                                    .text
                                    .length),
                        controller: controller.retailPriceController,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          labelText: "Retail Price",
                          labelStyle: const TextStyle(
                              fontSize: 18,
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
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      // width: 200,
                      margin: const EdgeInsets.only(top: 8),
                      child: TextField(
                        onTap: () =>
                        controller.wholeSalePriceController.selection =
                            TextSelection(
                                baseOffset: 0,
                                extentOffset: controller
                                    .wholeSalePriceController
                                    .value
                                    .text
                                    .length),
                        controller: controller.wholeSalePriceController,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          labelText: "Wholesale Price",
                          labelStyle: const TextStyle(
                              fontSize: 18,
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
                    Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        margin: const EdgeInsets.only(top: 8),
                        child: TextField(
                          controller: controller.categoryController.value,
                          onTap: (){
                            FocusScope.of(context).requestFocus(FocusNode());
                            Get.toNamed("/category");
                          },
                          decoration: InputDecoration(
                            floatingLabelBehavior:FloatingLabelBehavior.always,
                            labelText: "Category",
                            labelStyle: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal),
                            enabledBorder: const OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.grey[200],
                            focusedBorder: const OutlineInputBorder(),
                          ),
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      // width: 200,
                      margin: const EdgeInsets.only(top: 8),
                      child: TextField(
                        onTap: () => controller.discountController.selection =
                            TextSelection(
                                baseOffset: 0,
                                extentOffset: controller
                                    .discountController.value.text.length),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        controller: controller.discountController,
                        decoration: InputDecoration(
                          labelText: "Discount",
                          labelStyle: const TextStyle(
                              fontSize: 18,
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
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      // width: 200,
                      margin: const EdgeInsets.only(top: 8),
                      child: TextField(
                        onTap: () => controller.taxController.selection =
                            TextSelection(
                                baseOffset: 0,
                                extentOffset:
                                controller.taxController.value.text.length),
                        controller: controller.taxController,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          labelText: "Tax",
                          labelStyle: const TextStyle(
                              fontSize: 18,
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
                    ElevatedButton(
                        onPressed: () {
                          print("SM $selectedCategory");
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

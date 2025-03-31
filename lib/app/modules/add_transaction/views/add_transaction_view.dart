import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/add_transaction_controller.dart';

class AddTransactionView extends GetView<AddTransactionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddTransactionView'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          //  crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: IgnorePointer(
                child: Container(
                    height: 150,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black12),
                    width: 150,
                    child: const Icon(Icons.photo, size: 100)
                    // controller.file.value.path == ""
                    //     ? const Icon(Icons.add_photo_alternate, size: 100)
                    //     : ClipOval(
                    //   child: SizedBox.fromSize(
                    //     size: const Size.fromRadius(48),
                    //     child: Image.file(
                    //       controller.file.value,
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    // ),
                    ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Row(
                  children: [
                    Text('Retail'),
                    Radio(
                      visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: 0,
                      groupValue: 0,
                      onChanged: (int? value) {},
                    ),
                  ],
                ),
                SizedBox(width: 10.0,),
                Row(
                  children: [
                    Text('Wholesale'),
                    Radio(
                      visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: 1,
                      groupValue: 0,
                      onChanged: (int? value) {},
                    ),
                  ],
                )]),
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
                        extentOffset:
                            controller.titleController.value.text.length),
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / (20.0 / 9.0),
                  // width: 200,
                  margin: const EdgeInsets.only(top: 8),
                  child: TextField(
                    onTap: () => controller.quantityController.selection =
                        TextSelection(
                            baseOffset: 0,
                            extentOffset: controller
                                .quantityController.value.text.length),
                    controller: controller.quantityController,
                    keyboardType: TextInputType.number,
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
                    SizedBox(width: 10),
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  // width: 200,
                  margin: const EdgeInsets.only(top: 8),
                  child: TextField(
                    onTap: () => controller.quantityUnitController.selection =
                        TextSelection(
                            baseOffset: 0,
                            extentOffset: controller
                                .quantityUnitController.value.text.length),
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
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              // width: 200,
              margin: const EdgeInsets.only(top: 8),
              child: TextField(
                onTap: () => controller.discountController.selection =
                    TextSelection(
                        baseOffset: 0,
                        extentOffset:
                            controller.discountController.value.text.length),
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
                onTap: () => controller.taxController.selection = TextSelection(
                    baseOffset: 0,
                    extentOffset: controller.taxController.value.text.length),
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
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              // width: 200,
              margin: const EdgeInsets.only(top: 8),
              child: TextField(
                onTap: () => controller.priceController.selection = TextSelection(
                    baseOffset: 0,
                    extentOffset: controller.priceController.value.text.length),
                controller: controller.priceController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  labelText: "Total Price",
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  // width: 200,
                  width: Get.width / 2 - 15,
                  margin: const EdgeInsets.only(top: 8,),
                  child: TextField(
                    onTap: () => controller.paidController.selection =
                        TextSelection(
                            baseOffset: 0,
                            extentOffset: controller
                                .paidController.value.text.length),
                    controller: controller.paidController,
                    keyboardType: TextInputType.number,
                    // controller: controller.enterPinController,
                    decoration: InputDecoration(
                      labelText: "Paid",
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
                  width: Get.width / 2 - 15,
                  margin: const EdgeInsets.only(top: 8, left: 10),
                  child: TextField(
                    onTap: () => controller.dueController.selection =
                        TextSelection(
                            baseOffset: 0,
                            extentOffset: controller
                                .dueController.value.text.length),
                    controller: controller.dueController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      labelText: "Due",
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
            ElevatedButton(
                onPressed: () async {
                  await controller.addTransaction();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.add),
                    const Text('Add Sell Report'),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_category_controller.dart';

class AddCategoryView extends GetView<AddCategoryController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Add Category'),),
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
                              // width: 200,
                              margin: const EdgeInsets.only(top: 8),
                              child: TextField(
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
                            Container(
                              width: MediaQuery.of(context).size.width / 1.2,
                              // width: 200,
                              margin: const EdgeInsets.only(top: 8),
                              child: TextField(
                                controller: controller.descController,
                                keyboardType: TextInputType.text,
                                // controller: controller.enterPinController,
                                decoration: InputDecoration(
                                  labelText: "Description",
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
                            ElevatedButton(onPressed: () async {
                              await controller.addCategory();
                            }, child: const Text('Add Category'))
                          ])))
            ]
            )
        )
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

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Add Category'),),
        body: CustomScrollView(slivers: [
          SliverFillRemaining(
            hasScrollBody: true,
            child: Column(
              children: [
                Obx(() => Expanded(
                  child: ListView.builder(
                    itemCount: controller.items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: controller.items[index].photoUrl == ""
                            ? const Icon(Icons.photo, size: 60)
                            : ClipRect(
                          child: SizedBox.fromSize(
                            // size: const Size.fromRadius(48),
                            size: Size.square(50),
                            child: Image.file(
                              File(
                                  controller.items[index].photoUrl!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        shape: const Border(
                            bottom: BorderSide()),
                        title: Text(controller.items[index].title!),
                        subtitle: Text(controller.items[index].description!),
                        onTap: (){
                          controller.selectedCategory.value = controller.items[index];
                        },
                      );
                    },),
                )),
                // Spacer(),
                const SizedBox(height: 20,)
              ],
            ),)]),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Get.toNamed("/add_category");
          },
          child: const Icon(Icons.add),
        )
    );
  }
}

import 'dart:io';

import 'package:daily_sales_record/app/modules/add_customer/controllers/add_customer_controller.dart';
import 'package:daily_sales_record/app/modules/add_product/controllers/add_product_controller.dart';
import 'package:daily_sales_record/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../data/models/category.dart';
import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  CategoryView({super.key});
  final AddCustomerController addCustomerController = Get.find<AddCustomerController>();
  final AddProductController addProductController = Get.find<AddProductController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Add Category'),),
        body: CustomScrollView(slivers: [
          SliverFillRemaining(
            hasScrollBody: true,
            child: Column(
              children: [
                Obx(() => controller.items.isEmpty ?
                    Center(child: Text("Category List is empty. Add one."),)
                    : Expanded(
                  child: ListView.builder(
                    itemCount: controller.items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        // leading: controller.items[index].photo == ""
                        //     ? const Icon(Icons.photo, size: 60)
                        //     : Container(),
                      // ClipRect(
                       //   child: SizedBox.fromSize(
                        //     // size: const Size.fromRadius(48),
                        //     size: Size.square(50),
                        //     child: Image.file(
                        //       File(
                        //           controller.items[index].photo!),
                        //       fit: BoxFit.cover,
                        //     ),
                        //   ),
                        // ),
                        shape: const Border(
                            bottom: BorderSide()),
                        title: Text(controller.items[index].title!),
                        subtitle: Text(controller.items[index].description!),
                        onTap: (){
                          addCustomerController.selectedCategory.value = controller.items[index];
                          Get.back();
                        },
                        trailing: InkWell(
                          onTap: (){
                            Category category = controller.items[index];
                            controller.deleteCateGory(category.id ?? -1);
                            controller.items.remove(category);
                          },
                            child: Icon(Icons.delete_outlined)
                        ),

                      );
                    },),
                )),
                // Spacer(),
                const SizedBox(height: 20,)
              ],
            ),)]),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Get.toNamed(Routes.ADD_CATEGORY);
          },
          child: const Icon(Icons.add),
        )
    );
  }
}

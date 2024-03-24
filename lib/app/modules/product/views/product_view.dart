import 'dart:io';

import 'package:daily_sales_record/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../add_product/controllers/add_product_controller.dart';
import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  final addProductDep = Get.put(AddProductController());
  ProductView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Obx(() => Expanded(
              child: GridView.builder(
                itemCount: controller.allProducts.length,
                itemBuilder: (context, index) {
                  print('Index: $index');
                  return Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 80,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black12),
                          width: 80,
                          child: controller.allProducts[index].photoUrl == ""
                              ? const Icon(Icons.photo, size: 60, color: Colors.white,)
                              : ClipOval(
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(48),
                              child: Image.file(
                                File(
                                    controller.allProducts[index].photoUrl!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          controller.allProducts[index].title!,
                          style: const TextStyle(
                              fontSize: 18,
                            color: Colors.white
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Row(children: [
                            const Text("Retail: ", style: TextStyle(
                                color: Colors.white
                            ),),
                            const Spacer(),
                            Text("${controller.allProducts[index].retailPrice!}",
                                style: TextStyle(
                                    color: Colors.white
                                ))
                          ]),
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                const Text("Wholesale: ",
                                    style: TextStyle(
                                color: Colors.white
                            )),
                                const Spacer(),
                                Text(
                                    "${controller.allProducts[index].wholeSalePrice!}",
                                    style: TextStyle(
                                        color: Colors.white
                                    )),
                              ],
                            )),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                const Text("Available: ",style: TextStyle(
                  color: Colors.white
                  )),
                                Spacer(),
                                Text("${controller.allProducts[index].quantity!}",
                                    style: TextStyle(
                                        color: Colors.white
                                    )),
                              ],
                            )),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                const Text("Category: ",
                                    style: TextStyle(
                                        color: Colors.white
                                    )),
                                Spacer(),
                                Text(controller.allProducts[index].category!,
                                    style: TextStyle(
                                        color: Colors.white
                                    )),
                              ],
                            )),

                      ],
                    ),
                  );
                },
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                //  childAspectRatio: (3 / 4),
                    mainAxisExtent: 256
                ),
              ),
            ))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Get.toNamed(Routes.ADD_PRODUCT);

          },
          child: const Icon(Icons.add),
        ));
  }
}

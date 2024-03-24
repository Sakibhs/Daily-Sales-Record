import 'package:daily_sales_record/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/utilities/enums.dart';
import '../controllers/customer_controller.dart';
import 'package:get/get.dart';
class CustomerView extends GetView<CustomerController> {
   CustomerView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=>CustomerController());
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 7,
                height: 50.0,
                child: Obx(
                      () => Radio(
                      value: CustomerType.customer,
                      groupValue:
                      controller.selectedType.value,
                      onChanged: (value) {
                        controller.setTypeRadioButton(value as CustomerType);
                      }),
                ),
              ),
              const Text("Customer"),
              SizedBox(
                height: 50.0,
                width: MediaQuery.of(context).size.width / 7,
                child: Obx(
                      () => Radio(
                      value: CustomerType.shop,
                      groupValue:
                      controller.selectedType.value,
                      onChanged: (value) {
                        controller.setTypeRadioButton(value as CustomerType);
                      }),
                ),
              ),
              const Text("Shop")
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () { Get.toNamed(Routes.ADD_CUSTOMER); }, child: const Icon(Icons.add),
      ),
    );
  }
}

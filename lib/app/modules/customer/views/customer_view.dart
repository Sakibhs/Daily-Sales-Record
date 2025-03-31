import 'package:daily_sales_record/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../../common/enums.dart';
import '../controllers/customer_controller.dart';
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
          ),
          SizedBox(height: 12,),
          Obx(() => Expanded(
            child: GridView.builder(
              itemCount: controller.allCustomers.length,
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
                      Text(
                        controller.allCustomers[index].name,
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
                          const Text("Address: ", style: TextStyle(
                              color: Colors.white
                          ),),
                          const Spacer(),
                          Text(controller.allCustomers[index].address,
                              style: TextStyle(
                                  color: Colors.white
                              ))
                        ]),
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              const Text("Phone: ",
                                  style: TextStyle(
                                      color: Colors.white
                                  )),
                              const Spacer(),
                              Text(
                                  controller.allCustomers[index].phoneNumber,
                                  style: TextStyle(
                                      color: Colors.white
                                  )),
                            ],
                          )),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              const Text("Balance: ",style: TextStyle(
                                  color: Colors.white
                              )),
                              Spacer(),
                              Text("${controller.allCustomers[index].balance}",
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
                  mainAxisExtent: 256
              ),
            ),
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () { Get.toNamed(Routes.ADD_CUSTOMER); }, child: const Icon(Icons.add),
      ),
    );
  }
}

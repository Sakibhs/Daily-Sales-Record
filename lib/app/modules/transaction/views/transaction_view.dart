import 'package:daily_sales_record/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/transaction_controller.dart';

class TransactionView extends GetView<TransactionController> {

  const TransactionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      print('Index: $index');
                      return Container();})),
            InkWell(
                onTap: () {
                  Get.toNamed(Routes.ADD_TRANSACTION);
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.teal,
                  ),
                  child: SizedBox(
                    width: Get.width / 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.add, color: Colors.white,),
                         Text("Add Sale", style: TextStyle(
                            color: Colors.white
                        ),),
                      ],
                    ),
                  ),
                )),
            SizedBox(height: 15,),
          ],
        )
    );
  }
}

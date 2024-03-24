import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/transaction_controller.dart';

class TransactionView extends GetView<TransactionController> {

  const TransactionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  Obx(() => Expanded(
            child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  print('Index: $index');
                  return Container();})))
    );
  }
}

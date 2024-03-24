import 'package:daily_sales_record/app/modules/customer/views/customer_view.dart';
import 'package:daily_sales_record/app/modules/product/views/product_view.dart';
import 'package:daily_sales_record/app/modules/transaction/views/transaction_view.dart';
import 'package:daily_sales_record/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../app_colors/app_colors.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> mainPages = [CustomerView(), ProductView(), TransactionView()];
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily Sale Record"),
        bottom: TabBar(
          controller: controller.tabController,
          tabs: controller.myTabs,
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: mainPages,
      ),
      drawer: const MainDrawer(),
    );
  }
}

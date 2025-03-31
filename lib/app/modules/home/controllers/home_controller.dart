import 'package:daily_sales_record/data/models/unit_type_model.dart';
import 'package:daily_sales_record/data/repository/unit_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  late SharedPreferences prefs;
  final List<Tab> myTabs = <Tab>[
    const Tab(
      text: 'Customers',
      icon: Icon(Icons.people),
    ),
    const Tab(
      text: 'Products',
      icon: Icon(Icons.fact_check),
    ),
    const Tab(
      text: 'Transactions',
      icon: Icon(Icons.receipt_long),
    ),
  ];

  @override
  Future<void> onInit() async {
    super.onInit();
    tabController = TabController(vsync: this, length: myTabs.length, initialIndex: 1);
    prefs = await SharedPreferences.getInstance();
  //  if(prefs.containsKey(Prefs.firstOpenInput)) {
    UnitRepo unitRepo = UnitRepo();
    List<UnitTypeModel> models = [];
    models.add(UnitTypeModel());
    models.add(UnitTypeModel());
    models.add(UnitTypeModel());
    models.add(UnitTypeModel());
    models[0].title = "Weight";
    models[0].id = null;
    models[0].variantName = "kg";
    models[0].variantValue = 1.0;


    models[1].title = "Liquid";
    models[1].variantName = "litre";
    models[1].variantValue = 1.0;
    models[1].id = null;



    models[2].title = "Length";
    models[2].variantName = "meter";
    models[2].variantValue = 1.0;
    models[2].id = null;

    models[3].title = "Quantity";
    models[3].variantName = "piece";
    models[3].variantValue = 1.0;
    models[3].id = null;
      for (var model in models) {
        print("Sakib Check Model: ${model.variantName}");
        await unitRepo.add(model);
      }
   //   prefs.setBool(Prefs.firstOpenInput, true);
   // }



  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}

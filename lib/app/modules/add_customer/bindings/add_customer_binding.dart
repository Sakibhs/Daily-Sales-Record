import 'package:get/get.dart';

import '../controllers/add_customer_controller.dart';

class AddCustomerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddCustomerController>(
      () => AddCustomerController(),
    );
  }
}

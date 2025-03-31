import 'package:daily_sales_record/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  @override
  void onReady() {
    super.onReady();
    print("Sakib Checking");
    Future.delayed(Duration(milliseconds: 2000),(){
      Get.toNamed(Routes.LOGIN);
    });
  }

  @override
  void onClose() {}
}

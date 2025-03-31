import 'package:daily_sales_record/data/service/google_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  @override
  void onInit() {
    super.onInit();

  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> loginWithGoogle() async {
    GoogleAuthService service = GoogleAuthService();
    User? user = await service.signInWithGoogle();
    if(user != null){
      print("Sakib login check: ${user.email}");
    }
  }


  @override
  void onClose() {}
}

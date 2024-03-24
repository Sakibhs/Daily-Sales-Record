import 'package:daily_sales_record/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StartController extends GetxController{
  final userData = GetStorage();
  TextEditingController enterPinController = TextEditingController();
  TextEditingController confirmPinController = TextEditingController();
  void confirmAndGoToHomePIN(){
    String enterPIN = enterPinController.text;
    String confirmPIN = confirmPinController.text;
    if(enterPIN.isEmpty || confirmPIN.isEmpty){
      Fluttertoast.showToast(msg: "PIN can't be empty");
    } else if(enterPIN.length < 4 || confirmPIN.length < 4){
      Fluttertoast.showToast(msg: "PIN must be 4 digits long");
    }
    else if(enterPIN != confirmPIN){
      Fluttertoast.showToast(msg: "PIN not matched");
    } else if(enterPIN == confirmPIN){
      userData.write("PIN", confirmPIN);
      Get.offAndToNamed(Routes.HOME);
    }
  }
  bool isBeginning(){
    if(userData.read("PIN") == null){
      return true;
    }
    return false;
  }
  void goToHomePIN(){
    String pin = userData.read("PIN");
    String givenPin = enterPinController.text;
    if(givenPin == pin){
      Get.offAndToNamed(Routes.HOME);
    }
    else if(givenPin.isEmpty){
      Fluttertoast.showToast(msg: "PIN can't be empty");
    } else{
      Fluttertoast.showToast(msg: "Wrong PIN. Try Again.");
    }

  }
}

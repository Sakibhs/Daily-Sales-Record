import 'package:daily_sales_record/common/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: InkWell(
          onTap: () async {
            await controller.loginWithGoogle();
          },
          child: Container(
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color(0xfff5f5f5),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(color: Colors.teal, blurRadius: 1.5)
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Please sign in with google',
                  style: GoogleFonts.poppins(),
                ),
                SizedBox(
                  width: 10,
                ),
                Image.asset(height: 32, width: 32, 'assets/images/google_icon.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

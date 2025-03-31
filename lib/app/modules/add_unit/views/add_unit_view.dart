import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/add_unit_controller.dart';

class AddUnitView extends GetView<AddUnitController> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {

      });
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Units'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Center(
          child: ListView(
            children: [
              Text('Unit Type', style: GoogleFonts.poppins(
              ),),
              SizedBox(height: 10,),
              Row(
                children: [
                  Obx(() => DropdownButton(
                      value: controller.type.value,
                      underline: Container(
                        height: 2,
                        color: Colors.white,
                      ),
                      onChanged: (value){
                        controller.type.value = value!;
                      },
                      items: controller.menuItems
                    ),
                  ),
                  SizedBox(width: 10,),
                  SizedBox(
                      width: 200,
                      child: TextField(
                        controller: controller.unitTypeTitle,
                        decoration: InputDecoration(
                          hintText: "Add Unit Type"
                        ),
                      )),
                  SizedBox(width: 10,),
                  InkWell(
                      onTap: (){},
                      child: Text('Add')),
                ],
              ),
              SizedBox(height: 20,),
              Text('Unit Type', style: GoogleFonts.poppins(
              ),),
              SizedBox(height: 10,),
              Row(
                children: [
                  Obx(() => DropdownButton(
                      value: controller.type.value,
                      underline: Container(
                        height: 2,
                        color: Colors.white,
                      ),
                      onChanged: (value){
                        controller.type.value = value!;
                      },
                      items: controller.menuItems
                  ),
                  ),
                  SizedBox(width: 10,),
                  SizedBox(
                      width: 200,
                      child: TextField(
                        controller: controller.variantName,
                        decoration: InputDecoration(
                            hintText: "Add Unit Type"
                        ),
                      )),
                  SizedBox(width: 10,),
                  InkWell(
                      onTap: (){},
                      child: Text('Add')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/start_controller.dart';

class StartView extends GetView<StartController> {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily Sale Records"),
      ),
      body: CustomScrollView(slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.security,
                size: 100,
                color: Colors.teal,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: controller.isBeginning()
                    ? const Text(
                  "Enter Your security pin. You need this pin to open the app everytime.",
                  textAlign: TextAlign.center,
                )
                    : const Text(
                  "Enter Your security pin.",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              pinPage(),
            ],
          ),
        )
      ]),
    );
  }

  Widget pinPage() {
    if (controller.isBeginning()) {
      return Container(
        margin: const EdgeInsets.all(20),
        child: Container(
          //  color: Colors.blue,
          height: 220,
          width: 300,
          decoration: const BoxDecoration(color: Color(0xFF05F8E4)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: TextField(
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  controller: controller.enterPinController,
                  decoration: InputDecoration(
                    labelText: "Enter PIN",
                    labelStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal),
                      // borderRadius: BorderRadius.all(Radius.circular(30.0))
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.greenAccent),
                      //borderRadius: BorderRadius.all(Radius.circular(30.0))
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 200,
                child: TextField(
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  controller: controller.confirmPinController,
                  decoration: InputDecoration(
                    labelText: "Confirm PIN",
                    labelStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal),
                      // borderRadius: BorderRadius.all(Radius.circular(30.0))
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.greenAccent),
                      //borderRadius: BorderRadius.all(Radius.circular(30.0))
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () => {controller.confirmAndGoToHomePIN()},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal),
                  child: const Text("Confirm"))
            ],
          ),
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.all(20),
        child: Container(
          //  color: Colors.blue,
          height: 200,
          width: 300,
          decoration: const BoxDecoration(color: Color(0x4705F8E4)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: TextField(
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  controller: controller.enterPinController,
                  decoration: InputDecoration(
                    labelText: "Your PIN",
                    labelStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal),
                    enabledBorder: const OutlineInputBorder(
                      //  borderSide: BorderSide(color: Colors.teal),
                      // borderRadius: BorderRadius.all(Radius.circular(30.0))
                    ),
                    focusedBorder: const OutlineInputBorder(
                      // borderSide: BorderSide(color: Colors.blue),
                      //borderRadius: BorderRadius.all(Radius.circular(30.0))
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    controller.goToHomePIN();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Done", style: TextStyle(fontSize: 16.0),),
                  ))
            ],
          ),
        ),
      );
    }
  }
}

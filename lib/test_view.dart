import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/controller/test_controller.dart';

class TimerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TimerController controller = Get.put(TimerController());

    return Scaffold(
      appBar: AppBar(title: Text("Timer Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  "Remaining Time: ${controller.remainingTime.value} seconds",
                  style: TextStyle(fontSize: 24),
                )),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.startTimer(); // بدء العداد
              },
              child: Text("Start Timer"),
            ),
          ],
        ),
      ),
    );
  }
}

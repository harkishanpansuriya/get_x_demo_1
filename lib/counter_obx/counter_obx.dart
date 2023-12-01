import 'package:flutter/material.dart';
import 'package:get_x_demo_1/reusable_widgets/app_bar.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  var count = 0.obs;

  void increment() {
    count++;
  }

  void decrement() {
    if (count.value > 0) {
      count--;
    }
  }
}

class CounterUsingObxScreen extends StatelessWidget {
  CounterController counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    debugPrint("Rebuild Counter");
    return Scaffold(
      appBar: CustomAppBar(title: "Counter Using Obx"),
      body: Center(
        child: Obx(
          () => Text(
            counterController.count.value.toString(),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  counterController.increment();
                },
                icon: Icon(Icons.add),
              ),
              IconButton(
                onPressed: () {
                  counterController.decrement();
                },
                icon: Icon(Icons.remove_circle),
              ),
            ],
          )
        ],
      ),
    );
  }
}

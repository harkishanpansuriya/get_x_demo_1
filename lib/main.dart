import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_demo_1/SQflite/main_screen.dart';
import 'package:get_x_demo_1/counter_obx/counter_obx.dart';
import 'package:get_x_demo_1/dashboard.dart';
import 'package:get_x_demo_1/form_validation/form_validation.dart';
import 'package:get_x_demo_1/login_with_api/login.dart';
import 'package:get_x_demo_1/mixins_examples/api_call_mixins_main.dart';
import 'package:get_x_demo_1/notes_crud_variable/note_taking_screen_main.dart';
import 'package:get_x_demo_1/search_list/search_list.dart';
import 'package:get_x_demo_1/shopping_cart/shopping_cart.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Getx Adventures',
      initialRoute: '/', // Define your initial route if needed
      getPages: [
        GetPage(name: '/', page: () => DashboardScreen()), // Define your other routes
        // GetPage(name: '/dashboard', page: () => DashboardScreen()), // Add this line
      ],
    );
  }
}

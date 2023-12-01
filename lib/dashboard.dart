import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_demo_1/SQflite/main_screen.dart';
import 'package:get_x_demo_1/counter_obx/counter_obx.dart';
import 'package:get_x_demo_1/form_validation/form_validation.dart';
import 'package:get_x_demo_1/login_with_api/login.dart';
import 'package:get_x_demo_1/notes_crud_variable/note_taking_screen_main.dart';
import 'package:get_x_demo_1/observable_list_crud/observable_list_crud.dart';
import 'package:get_x_demo_1/reusable_widgets/app_bar.dart';
import 'package:get_x_demo_1/reusable_widgets/custom_button.dart';
import 'package:get_x_demo_1/search_list/search_list.dart';
import 'package:get_x_demo_1/shopping_cart/shopping_cart.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Getx Adventures',
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 15.0),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: functionsList().length,
                  separatorBuilder: (context, index) => const Divider(),
                  // You can use any separator you prefer
                  itemBuilder: (context, index) {
                    return functionsList()[index];
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> functionsList() {
    List<Widget> list = [
      CustomButton(
        text: "Counter",
        onPressed: () {
          Get.to(() => CounterUsingObxScreen());
        },
      ),
      CustomButton(
        text: "Sqflite",
        onPressed: () {
          Get.to(() => TaskManagementDashBoard());
        },
      ),
      CustomButton(
        text: "Cart Screen",
        onPressed: () {
          Get.to(() => ProductListScreen());
        },
      ),
      CustomButton(
        text: "Search List Screen",
        onPressed: () {
          Get.to(() => SearchListViewScreen());
        },
      ),
      CustomButton(
        text: "Observable List",
        onPressed: () {
          Get.to(() => ObservableListApp());
        },
      ),
      CustomButton(
        text: "Note Taking",
        onPressed: () {
          Get.to(() => NotesAddScreen());
        },
      ),
      CustomButton(
        text: "Login With Fake Api",
        onPressed: () {
          Get.to(() => LoginPageScreen());
        },
      ),
      CustomButton(
        text: "Form Validation & Submission",
        onPressed: () {
          Get.to(() => FormValidationEmailPassScreen());
        },
      ),
    ];

    return list;
  }
}

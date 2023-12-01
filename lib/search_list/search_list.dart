import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_demo_1/reusable_widgets/app_bar.dart';

class User {
  final int id;
  final String name;
  final int age;

  User({required this.id, required this.name, required this.age});
}

class SearchListViewScreen extends StatelessWidget {
  final MyListController controller = Get.put(MyListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'TextField in AppBar'),
      body: Obx(
        () => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  controller.filterData(value);
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.filteredUsers.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(controller.filteredUsers[index].name),
                    subtitle: Text(
                        "Age: ${controller.filteredUsers[index].age.toString()}"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyListController extends GetxController {
  var userList = <User>[
    User(id: 2, name: 'Bob', age: 30),
    User(id: 3, name: 'Charlie', age: 27),
    User(id: 4, name: 'David', age: 23),
    User(id: 5, name: 'Eve', age: 35),
    User(id: 6, name: 'Fred', age: 28),
    User(id: 7, name: 'Grace', age: 33),
    User(id: 8, name: 'Hannah', age: 26),
    User(id: 9, name: 'Ibrahim', age: 34),
    User(id: 10, name: 'Jack', age: 32),
    User(id: 11, name: 'Jill', age: 24),
    User(id: 12, name: 'Joe', age: 38),
    User(id: 13, name: 'Karen', age: 29),
    User(id: 14, name: 'Kevin', age: 22),
    User(id: 15, name: 'Kim', age: 30),
    User(id: 16, name: 'Lily', age: 21),
    User(id: 17, name: 'Maria', age: 36),
    User(id: 18, name: 'Mike', age: 31),
    User(id: 19, name: 'Nancy', age: 27),
    User(id: 20, name: 'Nina', age: 23),
    User(id: 21, name: 'Oliver', age: 39),
    User(id: 22, name: 'Pam', age: 37),
    User(id: 23, name: 'Rachel', age: 25),
    User(id: 24, name: 'Ryan', age: 29),
    User(id: 25, name: 'Sarah', age: 20),
    User(id: 26, name: 'Sophia', age: 37),
    User(id: 27, name: 'Taylor', age: 24),
    User(id: 28, name: 'Thomas', age: 41),
    User(id: 29, name: 'Vanessa', age: 28),
    User(id: 30, name: 'William', age: 35),
    User(id: 31, name: 'Zara', age: 31),
    User(id: 32, name: 'Alex', age: 29),
  ];

  var filteredUsers = <User>[].obs;

  @override
  void onInit() {
    filteredUsers.assignAll(userList);
    super.onInit();
  }

  void filterData(String query) {
    if (query.isEmpty) {
      filteredUsers.assignAll(userList);
    } else {
      filteredUsers.assignAll(userList
          .where(
              (user) => user.name.toLowerCase().contains(query.toLowerCase()))
          .toList());
    }
  }
}

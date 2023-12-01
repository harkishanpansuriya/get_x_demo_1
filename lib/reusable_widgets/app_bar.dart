import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;

  const CustomAppBar({
    required this.title,
    this.actions = const [],
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: Colors.white,
      title: Text(
        title,
        style: TextStyle(color: Colors.white), // Set text color to white
      ),
      backgroundColor: Colors.black, // Set background color to black
      actions: [
        IconButton(
          onPressed: () {
            // Check if the current route is not the same as the route you want to navigate to
            if (Get.currentRoute != '/dashboard') {
              Get.offNamed('/'); // Replace with the correct route name
            }
          },
          icon: const Icon(Icons.home),
        ),
        ...actions
      ],
    );
  }
}

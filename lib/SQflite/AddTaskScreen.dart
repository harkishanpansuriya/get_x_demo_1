import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_demo_1/SQflite/Task.dart';
import 'package:get_x_demo_1/SQflite/TaskController.dart';
import 'package:get_x_demo_1/reusable_widgets/app_bar.dart';

class AddTaskScreen extends StatelessWidget {
  final TaskController _taskController = Get.find<TaskController>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Add Task"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title')),
            SizedBox(height: 10),
            TextField(
                controller: descriptionController,
                maxLines: null,
                decoration: InputDecoration(labelText: 'Description')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newTask = Task(
                  id: DateTime.now().millisecondsSinceEpoch,
                  title: titleController.text,
                  description: descriptionController.text,
                );
                _taskController.addTask(newTask);
                Get.back();
              },
              child: Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}

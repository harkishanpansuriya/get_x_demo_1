import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_demo_1/SQflite/Task.dart';
import 'package:get_x_demo_1/SQflite/TaskController.dart';


class EditTaskScreen extends StatelessWidget {
  final TaskController _taskController = Get.find<TaskController>();
  final Task task;

  EditTaskScreen({required this.task});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: task.title);
    final descriptionController = TextEditingController(text: task.description);

    return Scaffold(
      appBar: AppBar(title: Text('Edit Task')),
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
                final updatedTask = Task(
                  id: task.id,
                  title: titleController.text,
                  description: descriptionController.text,
                );
                _taskController.updateTask(updatedTask);
                Get.back();
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}

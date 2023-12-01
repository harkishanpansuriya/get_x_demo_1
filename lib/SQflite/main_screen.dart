import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_demo_1/SQflite/AddTaskScreen.dart';
import 'package:get_x_demo_1/SQflite/EditTaskScreen.dart';
import 'package:get_x_demo_1/SQflite/TaskController.dart';
import 'package:get_x_demo_1/reusable_widgets/app_bar.dart';

class TaskManagementDashBoard extends StatelessWidget {
  final TaskController _taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Task Management App Using Sqflite"),
      body: Obx(() {
        if (_taskController.tasks.isEmpty) {
          return Center(child: Text('No tasks available.'));
        } else {
          return ListView.builder(
            itemCount: _taskController.tasks.length,
            itemBuilder: (context, index) {
              final task = _taskController.tasks[index];
              return ListTile(
                title: Text(task.title),
                subtitle: Text(task.description),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _taskController.deleteTask(task.id);
                  },
                ),
                onTap: () {
                  Get.to(EditTaskScreen(task: task));
                },
              );
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddTaskScreen());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

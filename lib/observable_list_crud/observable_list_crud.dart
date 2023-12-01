import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_demo_1/reusable_widgets/app_bar.dart';

class Task {
  final int id;
  late final String title;

  Task({required this.id, required this.title});
}

class TaskController extends GetxController {
  var tasks = <Task>[].obs;

  TaskController() {
    tasks.assignAll([
      Task(id: 1, title: "Task 1"),
      Task(id: 2, title: "Task 2"),
      Task(id: 3, title: "Task 3"),
      Task(id: 4, title: "Task 4"),
      Task(id: 5, title: "Task 5"),
      Task(id: 6, title: "Task 6"),
    ]);
  }

  void addTask(String title) {
    final newTask =
        Task(id: DateTime.now().millisecondsSinceEpoch, title: title);
    tasks.add(newTask);
  }

  void updateTask(int id, String updatedTitle) {
    final index = tasks.indexWhere((task) => task.id == id);
    if (index != -1) {
      tasks[index].title = updatedTitle;
    }
  }

  void deleteTask(int id) {
    tasks.removeWhere((task) => task.id == id);
  }
}

class ObservableListApp extends StatelessWidget {
  final TaskController _taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    debugPrint("ObservableListApp Called");
    return Scaffold(
      appBar: CustomAppBar(title: "Observable List"),
      body: Obx(() {
        return ListView.builder(
          itemCount: _taskController.tasks.length,
          itemBuilder: (context, index) {
            final task = _taskController.tasks[index];
            return ListTile(
              title: Text(task.title),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      _showEditDialog(context, task);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _taskController.deleteTask(task.id);
                    },
                  ),
                ],
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddDialog(BuildContext context) {
    TextEditingController titleController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Task'),
          content: TextField(controller: titleController),
          actions: [
            TextButton(
              onPressed: () {
                _taskController.addTask(titleController.text);
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _showEditDialog(BuildContext context, Task task) {
    TextEditingController titleController =
        TextEditingController(text: task.title);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Task'),
          content: TextField(controller: titleController),
          actions: [
            TextButton(
              onPressed: () {
                _taskController.updateTask(task.id, titleController.text);
                Navigator.pop(context);
              },
              child: Text('Update'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

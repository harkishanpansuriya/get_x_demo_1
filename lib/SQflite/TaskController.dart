import 'package:get/get.dart';
import 'package:get_x_demo_1/SQflite/DatabaseHelper.dart';
import 'package:get_x_demo_1/SQflite/Task.dart';

class TaskController extends GetxController {
  var tasks = <Task>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTasks();
  }

  Future<void> fetchTasks() async {
    final db = await DatabaseHelper.initDatabase();
    final taskMapList = await db.query('tasks');
    tasks.assignAll(taskMapList.map((taskMap) => Task(
          id: taskMap['id'] as int,
          title: taskMap['title'] as String,
          description: taskMap['description'] as String,
        )));
  }

  Future<void> addTask(Task task) async {
    final db = await DatabaseHelper.initDatabase();
    await db.insert('tasks', {
      'title': task.title,
      'description': task.description,
    });
    fetchTasks();
  }

  Future<void> updateTask(Task task) async {
    final db = await DatabaseHelper.initDatabase();
    await db.update(
      'tasks',
      {
        'title': task.title,
        'description': task.description,
      },
      where: 'id = ?',
      whereArgs: [task.id],
    );
    fetchTasks();
  }

  Future<void> deleteTask(int id) async {
    final db = await DatabaseHelper.initDatabase();
    await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
    fetchTasks();
  }
}

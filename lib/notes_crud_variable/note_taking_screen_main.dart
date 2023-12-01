import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_demo_1/notes_crud_variable/notes_controller.dart';
import 'package:get_x_demo_1/notes_crud_variable/notes_detail_screen.dart';
//
// Get.put() is a method provided by the GetX package in Flutter, specifically the Get class.
// It is used for dependency injection and state management. Here's why Get.put() is used in your code:
//
// Dependency Injection: In your code, you have a NotesController that manages the state of your notes.
// Dependency injection is a way to provide instances of dependencies to classes that need them.
// By using Get.put(NotesController()),
// you are telling GetX to create a single instance of the NotesController and make it available for injection throughout your app.
//
// Singleton: When you use Get.put() with a class,
// GetX ensures that a single instance of that class is created and reused whenever it is needed.
// This singleton instance is shared across different parts of your app that request the same dependency.
//
// State Management: In your code,
// the NotesController is responsible for managing the state of your notes, including adding, deleting, and accessing notes.
// By creating a single instance of NotesController using Get.put(),
// you ensure that all parts of your app that rely on this controller share the same state.
//
// Efficient Rebuilding: GetX provides reactive state management,
// and when you use Get.put(),
// the widgets that depend on this controller will be updated automatically when the state within the controller changes.
// This is achieved using the reactive programming paradigm that GetX implements.
//
// In summary, Get.put() is used to manage dependencies and state in a centralized way using the GetX package.
// It creates a singleton instance of a class and makes that instance available for injection and state management throughout your app.
// This helps in maintaining a consistent state and efficient widget rebuilding

class NotesAddScreen extends StatelessWidget {
  final NotesController _notesController = Get.put(NotesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Note Taking App')),
      body: Obx(() {
        if (_notesController.notes.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: _notesController.notes.length,
            itemBuilder: (context, index) {
              final note = _notesController.notes[index];
              return ListTile(
                title: Text(note.title),
                subtitle: Text(note.content),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    _notesController.deleteNote(note.id);
                  },
                ),
                onTap: () {
                  Get.to(() => NoteDetailScreen(note: note));
                },
              );
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(NoteDetailScreen());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

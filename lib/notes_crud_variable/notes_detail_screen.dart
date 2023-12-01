import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_demo_1/notes_crud_variable/note_model.dart';
import 'package:get_x_demo_1/notes_crud_variable/notes_controller.dart';

//
// Get.find() is another method provided by the GetX package in Flutter.
// It's used to retrieve a previously registered instance of a controller or service from the GetX dependency injection system.
// While Get.put() is used to register and create an instance, Get.find() is used to retrieve an existing instance.
// Here's why you might use Get.find():
//
// Retrieving Existing Instances: If you've registered an instance of a controller or service using Get.put(),
// you can later retrieve that instance using Get.find().
// This is useful when you want to access the same instance of a controller or service from different parts of your app.
//
// Sharing State: Suppose you have a controller managing a certain aspect of your app's state,
// and you want to access that state from different screens or widgets.
// By using Get.find(), you can retrieve the same instance of the controller and access its state,
// ensuring that you're working with the most up-to-date data.
//
// Scoped Instances: While Get.put() creates a singleton instance of a controller,
// you might want to create scoped instances for specific use cases, like a pop-up or a modal.
// In these cases, you can use Get.put() with an instance name,
// and later retrieve that scoped instance using Get.find() with the same instance name.

class NoteDetailScreen extends StatelessWidget {
  final NotesController _notesController = Get.find<NotesController>();
  final Note? note;

  NoteDetailScreen({this.note});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: note?.title ?? '');
    final contentController = TextEditingController(text: note?.content ?? '');

    return Scaffold(
      appBar: AppBar(title: Text(note == null ? 'Add Note' : 'Edit Note')),
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
                controller: contentController,
                maxLines: null,
                decoration: InputDecoration(labelText: 'Content')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final updatedNote = Note(
                  id: note?.id ?? DateTime.now().millisecondsSinceEpoch,
                  title: titleController.text,
                  content: contentController.text,
                );
                if (note == null) {
                  _notesController.addNote(updatedNote);
                } else {
                  _notesController.updateNote(updatedNote);
                }
                Get.back();
              },
              child: Text(note == null ? 'Add Note' : 'Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}

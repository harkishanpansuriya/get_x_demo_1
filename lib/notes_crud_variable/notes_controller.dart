import 'package:get/get.dart';
import 'package:get_x_demo_1/notes_crud_variable/note_model.dart';

class NotesController extends GetxController {
  var notes = <Note>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchNotes();
  }

  Future<void> fetchNotes() async {
    // Simulate fetching notes from a database or API
    await Future.delayed(Duration(seconds: 2));
    notes.assignAll([
      Note(id: 1, title: 'Note 1', content: 'This is the content of Note 1.'),
      Note(id: 2, title: 'Note 2', content: 'This is the content of Note 2.'),
      Note(id: 3, title: 'Note 3', content: 'This is the content of Note 3.'),
    ]);
  }

  void addNote(Note note) {
    notes.add(note);
  }

  void updateNote(Note updatedNote) {
    final index = notes.indexWhere((note) => note.id == updatedNote.id);
    if (index != -1) {
      notes[index] = updatedNote;
    }
  }

  void deleteNote(int id) {
    notes.removeWhere((note) => note.id == id);
  }
}

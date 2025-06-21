import 'note_model.dart';

class NoteController {
  static List<NoteModel> noteList = [];

  static void addNote({
    required NoteModel model,
  }) {
    NoteController.noteList.add(model);
  }

  static void clearAllNotes() {
    noteList.clear();
  }

  static void updateNote({
    required int index,
    required String title,
    required String desc,
  }) {
    noteList[index].title = title;
    noteList[index].description = desc;
  }

  static void removeSingleNote({
    required int index,
  }) {
    noteList.removeAt(index);
  }
}

/// MVC
var jsonData = [
  {
    "title": "Note 1",
    "description": "This is a note",
  },
  {
    "title": "Note 2",
    "description": "This is a note",
  },
];

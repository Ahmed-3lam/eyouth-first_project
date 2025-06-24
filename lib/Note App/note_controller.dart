import 'package:first_project/Note%20App/helpers/hive_helper.dart';

class NoteController {
  static List<String> noteList = [];

  static void addNote({
    required String title,
  }) {
    NoteController.noteList.add(title);
    HiveHelper.addNote(noteList);
  }

  static void clearAllNotes() {
    noteList.clear();
    HiveHelper.clearAllNotes();
  }

  static void updateNote({
    required int index,
    required String title,
  }) {
    noteList[index] = title;

    HiveHelper.updateNote();
  }

  static void removeSingleNote({
    required int index,
  }) {
    NoteController.noteList.removeAt(index);
    HiveHelper.removeSingleNote();
  }
}

/// MVC

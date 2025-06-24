import 'package:first_project/Note%20App/note_controller.dart';
import 'package:hive/hive.dart';

class HiveHelper {
  static const NOTE_BOX = "NOTE_BOX";
  static const NOTE_KEY = "NOTE_KEY";

  static Future<void> getAllNotes() async {
    if (Hive.box(NOTE_BOX).get(NOTE_KEY) != null &&
        Hive.box(NOTE_BOX).isNotEmpty) {
      NoteController.noteList = await Hive.box(NOTE_BOX).get(NOTE_KEY);
    }
  }

  static void addNote(List<String> noteList) {
    Hive.box(NOTE_BOX).put(NOTE_KEY, noteList);
  }

  static void clearAllNotes() {
    Hive.box(NOTE_BOX).clear();
  }

  static void removeSingleNote() async {
    await Hive.box(NOTE_BOX).put(NOTE_KEY, NoteController.noteList);
  }

  static void updateNote() {
    Hive.box(NOTE_BOX).put(NOTE_KEY, NoteController.noteList);
  }
}

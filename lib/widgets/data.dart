import './note.dart';

class Data {
  static List<Note> data = [];

  static void getNote(int noteId, String note) {
    data = [...data, Note(noteId, note)];
  }
}

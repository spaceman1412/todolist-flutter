import './note.dart';

class Data {
  static List<Note> data = [];

  static void getNote(int noteId, String note) {
    data = [...data, Note(noteId, note)];
    print(data.toString());
  }

  static void deleteNote(int noteId, String note) {
    List<Note> filterList = data.where((note) {
      return note.id != noteId;
    }).toList();
    data = filterList;
    print(data.toString());
  }
}

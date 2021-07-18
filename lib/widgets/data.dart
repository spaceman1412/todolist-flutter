import './note.dart';
import '../screens/homescreen.dart';

class Data {
  static List<Note> data = [];

  static int initialId = 0;

  final Function callState;

  Data(this.callState);

  static void increaseId() {
    initialId++;
  }

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

  static void editState(int noteId, String value) {
    List<Note> newList = Data.data.map((note) {
      if (note.id == noteId) {
        note.value = value;
        return note;
      } else
        return note;
    }).toList();
    data = newList;
    print(data.toString());
  }
}

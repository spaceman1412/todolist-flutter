import 'package:flutter/material.dart';
import './screens/homescreen.dart';
import './screens/add_note.dart';

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddNoteScreen(),
    );
  }
}

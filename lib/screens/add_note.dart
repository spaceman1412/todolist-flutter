import 'package:flutter/material.dart';
import '../widgets/text_section.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        btnEdit(),
        Row(
          children: [
            CustomCheckBox(),
            textBox(),
          ],
        ),
      ],
    ));
  }
}

class textBox extends StatelessWidget {
  const textBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TextField(
      decoration: InputDecoration(
          hintText: "Insert your message",
          filled: true,
          fillColor: Colors.transparent,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          )),
      scrollPadding: EdgeInsets.all(10.0),
      autofocus: true,
      keyboardType: TextInputType.multiline,
      maxLines: null,
    ));
  }
}

class btnEdit extends StatelessWidget {
  const btnEdit({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16, 55, 0, 0),
          child: Text(
            'Cancel',
            style: TextStyle(
              fontSize: 18,
              color: Colors.blue,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(314, 55, 16, 0),
          child: Text(
            'Done',
            style: TextStyle(
              fontSize: 19,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

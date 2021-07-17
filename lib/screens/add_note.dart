import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/text_section.dart';
import '../widgets/data.dart';
import './homescreen.dart';

class AddNoteScreen extends StatelessWidget {
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
  static final _formKey = GlobalKey<FormState>();
  static TextEditingController valueController = new TextEditingController();

  static String getValue() {
    return valueController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Insert your note",
                filled: true,
                fillColor: Colors.transparent,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
              scrollPadding: EdgeInsets.all(10.0),
              autofocus: true,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              textInputAction: TextInputAction.done,
              controller: valueController,
            ),
          ],
        ),
      ),
    );
  }
}

class btnEdit extends StatelessWidget {
  final _formKey = textBox._formKey;
  String value = '';
  int initialID = 0;
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
          child: GestureDetector(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                value = textBox.getValue();
                print(value);
                Data.getNote(initialID, value);
                initialID++;
                Navigator.pop(context);
              }
            },
            child: Text(
              'Done',
              style: TextStyle(
                fontSize: 19,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

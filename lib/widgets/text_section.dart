import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/homescreen.dart';
import '../screens/add_note.dart';
import './data.dart';

class TextSection extends StatelessWidget {
  final _value;
  final _id;
  final Function func;

  bool onHold = false;
  TextSection(this._id, this._value, this.func);

  void Delete(int noteId, String note) {
    Data.deleteNote(noteId, note);
    func();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Expanded(
        child: Column(children: [
          Row(
            children: [
              CustomCheckBox(),
              GestureDetector(
                child: Text(
                  '$_value',
                  style: TextStyle(fontSize: 20),
                ),
                onLongPress: () => {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Delete?'),
                      content: const Text('Do you want to delete?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('No'),
                        ),
                        TextButton(
                          onPressed: () {
                            Delete(_id, _value);
                            Navigator.pop(context);
                          },
                          child: const Text('Yes'),
                        ),
                      ],
                    ),
                  )
                },
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AddNoteScreen(true, _value, _id, func),
                    ),
                  );
                },
              ),
            ],
          ),
          Divider(
            color: Colors.black,
            height: 15,
            indent: 25,
          )
        ]),
      ),
    );
  }
}

class CustomCheckBox extends StatelessWidget {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Transform.scale(
        scale: 1.5,
        child: Checkbox(
          value: isChecked,
          onChanged: (bool? value) {
            isChecked = value!;
          },
          shape: CircleBorder(),
        ),
      ),
    );
  }
}

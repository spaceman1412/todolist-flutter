import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_list/screens/homescreen.dart';
import '../widgets/text_section.dart';
import '../widgets/data.dart';

class AddNoteScreen extends StatefulWidget {
  final bool _isEdit;
  final _value;
  final _id;
  final Function func;
  AddNoteScreen(this._isEdit, this._value, this._id, this.func);

  @override
  _AddNoteScreenState createState() =>
      _AddNoteScreenState(_isEdit, _value, _id, func);
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final bool _isEdit;
  final _value;
  final _id;
  final Function func;
  _AddNoteScreenState(this._isEdit, this._value, this._id, this.func);
  @override
  void initState() {
    _getThingsOnStartup().then((value) {
      print('Async complete');
      btnEdit._id = _id;
      btnEdit._isEdit = _isEdit;
      print('isEdit value: $_isEdit');

      if (_isEdit) {
        textBox.changetextEdit(_value);
      } else {
        textBox.changetextEdit('');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        btnEdit(func),
        Row(
          children: [
            CustomCheckBox(),
            textBox(),
          ],
        ),
      ],
    ));
  }

  Future _getThingsOnStartup() async {
    await Future.delayed(Duration(seconds: 0));
  }
}

class textBox extends StatelessWidget {
  static final _formKey = GlobalKey<FormState>();
  static TextEditingController valueController = new TextEditingController();

  static void changetextEdit(String _valueChanged) {
    valueController.text = _valueChanged;
    print('Text changed: ${valueController.text}');
  }

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
  int initialID = Data.initialId;
  final Function func;
  btnEdit(this.func);

  static void setEdit(bool value) {
    _isEdit = value;
  }

  static int _id = -1;
  static bool _isEdit = false;

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
                print(_isEdit);
                func();
                if (_isEdit == false) {
                  Data.getNote(initialID, value);
                  Data.increaseId();
                } else if (_isEdit == true) {
                  Data.editState(_id, value);
                }
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

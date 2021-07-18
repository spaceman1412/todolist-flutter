import 'package:flutter/material.dart';
import 'package:todo_list/screens/add_note.dart';
import '../widgets/text_section.dart';
import '../widgets/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String test = '';
  void setStatefunc() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: Stack(
          children: [
            Column(
              children: Data.data
                  .map((note) => TextSection(note.id, note.value, setStatefunc))
                  .toList(),
            ),
            customBtn(context, setStatefunc),
          ],
        ));
  }
}

AppBar CustomAppBar() {
  return AppBar(
    title: Column(
      children: [
        Padding(
          child: Text(
            'Today',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 32),
          ),
          padding: EdgeInsets.fromLTRB(40, 60, 0, 45),
        )
      ],
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}

Widget customBtn(final context, void func()) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 25, 55),
    child: Align(
      alignment: Alignment.bottomRight,
      child: Transform.scale(
        scale: 2,
        child: ElevatedButton(
          onPressed: () async {
            final value = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddNoteScreen()),
            );
            func();
          },
          child: Text(
            '+',
            style: TextStyle(
              fontSize: 18,
              color: Colors.blue,
            ),
          ),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            primary: Colors.white,
          ),
        ),
      ),
    ),
  );
}

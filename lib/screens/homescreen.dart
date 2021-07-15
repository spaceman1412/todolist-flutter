import 'package:flutter/material.dart';
import '../widgets/text_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: Stack(
          children: [
            Column(
              children: [
                TextSection(),
                TextSection(),
              ],
            ),
            customBtn(),
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

Widget customBtn() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 25, 55),
    child: Align(
      alignment: Alignment.bottomRight,
      child: Transform.scale(
        scale: 2,
        child: ElevatedButton(
          onPressed: () {},
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

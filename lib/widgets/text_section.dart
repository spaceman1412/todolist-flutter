import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Expanded(
        child: Column(children: [
          Row(
            children: [
              CustomCheckBox(),
              Text(
                'This is a text',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Divider(
            color: Colors.black,
            height: 15,
            indent: 45,
          )
        ]),
      ),
    );
  }

  Widget CustomCheckBox() {
    return Transform.scale(
      scale: 1.3,
      child: Checkbox(
        value: isChecked,
        onChanged: (bool? value) {
          isChecked = value!;
        },
        shape: CircleBorder(),
      ),
    );
  }
}
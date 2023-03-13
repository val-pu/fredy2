import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FredTitle extends StatelessWidget {
  var text;
  IconData icon;

  FredTitle({super.key,
    this.text = "Test",
    this.icon = Icons.calendar_today_outlined});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        child: Row(
          children: [
            Icon(icon),
            Padding(padding: const EdgeInsets.all(10), child:
            Text(
              text,
              style: const TextStyle(
                fontSize: 20.0,
              ),
            ),)
          ],
        ));
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';

class GroupPage extends StatefulWidget {
  GroupPage({super.key, required this.groupId});

  String groupId = "";
  String groupName = "Test";
  String groupDescription = "Lorem Ipsum";

  @override
  State<StatefulWidget> createState() {
    return _GroupPageState();
  }
}

class _GroupPageState extends State<GroupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(widget.groupName),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            widget.groupDescription,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 80),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: const Offset(0, 2),
                      ),
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Sehe alle Vorschlaege ein"),
                        Icon(Icons.chevron_right)
                      ]),
                ),
              ))
        ],
      ),
    );
  }
}

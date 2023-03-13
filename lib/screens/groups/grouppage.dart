import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fredy2/widgets/title.dart';

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
          children: [
            Row(
              children: [
                FredTitle(
                  text: "Aktuelle Veranstaltunegn",
                  icon: Icons.calendar_today_outlined,
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  primary: true,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return Container(
                        margin: const EdgeInsets.all(10),
                        child: Wrap(children: [
                          DecoratedBox(
                              decoration: const BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4))),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        color: Colors.indigo,
                                        child: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text("Eventname")),
                                      )
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: Text("MO"),
                                  )
                                ],
                              ))
                        ]));
                  }),
            )
          ],
        ));
  }
}

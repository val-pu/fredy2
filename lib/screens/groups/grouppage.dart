
import 'package:flutter/material.dart';
import 'package:fredy2/widgets/title.dart';

class GroupPageArgs {
  final String uuid;

  GroupPageArgs(this.uuid);
}


class GroupPage extends StatefulWidget {
  const GroupPage({super.key});

  final String groupId = "";
  final String groupName = "Test";
  final String groupDescription = "Lorem Ipsum";

  @override
  State<StatefulWidget> createState() {
    return _GroupPageState();
  }
}

class _GroupPageState extends State<GroupPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as GroupPageArgs;
    // TODO use args.uuid to get activities from api
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

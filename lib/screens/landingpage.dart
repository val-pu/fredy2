import 'package:flutter/material.dart';
import 'package:fredy2/screens/groups/grouppage.dart';

class LandingPage extends StatefulWidget {
  LandingPage({super.key}) {
    groups.add(GroupItem("Test", "name", "description"));
  }

  final groups = <GroupItem>[GroupItem("id", "name", "description")];

  @override
  State<StatefulWidget> createState() {
    return _LandingPageState();
  }
}

class _LandingPageState extends State<LandingPage> {
  void startGroupActivity(String id) {
    var s = const SnackBar(
      content: Text("Landing Page"),
    );
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => GroupPage(groupId: id)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("a"),
        ),
        body: ListView.builder(
          itemCount: widget.groups.length,
          itemBuilder: (context, i) {
            var currentGroup = widget.groups[i];
            return ListTile(
              title: Text(currentGroup.name),
              onTap: () {
                startGroupActivity(currentGroup.id);
              },
              subtitle: Text(currentGroup.description),
            );
          },
        ));
  }
}

class GroupItem {
  final String id;
  final String name;
  final String description;

  GroupItem(this.id, this.name, this.description);
}

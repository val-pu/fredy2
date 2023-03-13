import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fredy2/screens/groups/grouppage.dart';
import 'package:fredy2/api/groups/groups.dart' as groups;

import '../api/groups/models.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Groups"),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, "/settings");
          }, icon: const Icon(Icons.settings)),
        ],
      ),
      body: FutureBuilder<List<Group>>(
        future: groups.getGroups(),
        builder: (context, snapshot) {
          if(snapshot.hasError){
            return Text(snapshot.error.toString());
          }
          if (!snapshot.hasData){
            return const Center(child: CircularProgressIndicator());
          }
          var data = snapshot.data;
          if(data == null){
            return const Text("Dieser Text sollte nie zu sehen sein");
          }
          if(data.isEmpty){
            return const Text("Du bist in keiner Gruppe");
          }
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, i) {
              return ListTile(
                title: Text(data[i].name),
                onTap: () {
                  Navigator.pushNamed(context, "/group/");
                },
                subtitle: Text(data[i].description),
              );
            },
          );
        },
      ),
      floatingActionButton: SpeedDial(
        children: [
          SpeedDialChild(
              child: const Icon(Icons.login),
              label: "Join",
              onTap: (){
                Navigator.pushNamed(context, "/join");
              }
          ),
          SpeedDialChild(child: const Icon(Icons.add))
        ],
        child: const Icon(Icons.add),
      ),
    );
  }
}

class LandingPage_ extends StatefulWidget {
  LandingPage_({super.key}) {}

  @override
  State<StatefulWidget> createState() {
    return _LandingPageState_();
  }
}

class _LandingPageState_ extends State<LandingPage_> {
  void startGroupActivity(String id) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => GroupPage(groupId: id)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("a"),
          actions: [
            PopupMenuButton(
                icon: Icon(Icons.book),
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem<int>(
                      value: 0,
                      child: Text("My Account"),
                    ),
                    const PopupMenuItem<int>(
                      value: 1,
                      child: Text("Settings"),
                    ),
                    const PopupMenuItem<int>(
                      value: 2,
                      child: Text("Logout"),
                    ),
                  ];
                },
                onSelected: (value) {
                  if (value == 0) {
                    print("My account menu is selected.");
                  } else if (value == 1) {
                    print("Settings menu is selected.");
                  } else if (value == 2) {
                    print("Logout menu is selected.");
                  }
                }),
          ],
        ),
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, i) {
            return ListTile(
              title: const Text(""),
              onTap: () {
                startGroupActivity("");
              },
              subtitle: Text(""),
            );
          },
        ));
  }
}

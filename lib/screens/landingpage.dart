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
            if (snapshot.error.toString() == "Unauthenticated") {
              Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
            }
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
                  Navigator.pushNamed(context, "/group", arguments: GroupPageArgs(data[i].uuid));
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

import 'package:flutter/material.dart';

import '../../api/groups/models.dart';
import '../../api/groups/groups.dart' as api;

class CreateGroupPage extends StatefulWidget {
  const CreateGroupPage({Key? key}) : super(key: key);

  @override
  State<CreateGroupPage> createState() => _CreateGroupPageState();
}

class _CreateGroupPageState extends State<CreateGroupPage> {
  late TextEditingController _nameController;
  late TextEditingController _descController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _descController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    super.dispose();
  }

  Future<Group> createGroup() async {
    var group = await api.createGroup(
        _nameController.text, _descController.text);
    return group;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Group")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Create group", style: Theme
              .of(context)
              .textTheme
              .displaySmall),
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              label: Text("Name"),
            ),
          ),
          TextFormField(
            controller: _descController,
            decoration: const InputDecoration(
              label: Text("Description"),
            ),
          ),
          ElevatedButton(onPressed: () {
            createGroup().then((value) => {
            // Maybe route direct to group page
            Navigator.pushNamedAndRemoveUntil(context, "/landing", (route) => false)
            }).catchError((err) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Error: ${err.toString()}"))
              );
            });
          }, child: const Text("Create"))
        ],
      ),
    );
  }
}

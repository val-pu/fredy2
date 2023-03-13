import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fredy2/api/groups/groups.dart' as groups;

class JoinGroupPage extends StatefulWidget {
  const JoinGroupPage({Key? key}) : super(key: key);

  @override
  State<JoinGroupPage> createState() => _JoinGroupPageState();
}

class _JoinGroupPageState extends State<JoinGroupPage> {
  late TextEditingController _controller;
  bool _buttonDisabled = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> joinGroup() async {
    setState(() {
      _buttonDisabled = true;
    });
    String link = _controller.text;
    await groups.joinGroup(link);
    setState(() {
      _buttonDisabled = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: "Einladungslink",
                icon: Icon(Icons.link),
              ),
            ),
            ElevatedButton(
              onPressed: _buttonDisabled
                  ? null
                  : () {
                      joinGroup()
                          .then((void x) => {
                                Navigator.pushReplacementNamed(
                                    context, "/landing")
                              })
                          .catchError((err) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Error: $err")));
                        setState(() {
                          _buttonDisabled = false;
                        });
                      });
                    },
              child: const Text("Gruppe beitreten"),
            )
          ]),
    );
  }
}

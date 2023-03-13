import 'package:flutter/material.dart';
import 'package:fredy2/utils/utils.dart' as utils;

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            utils
                .clearLoginCreds()
                .then((value) => {Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false)});
          },
          child: const Text("Logout"),
        ),
      ),
    );
  }
}


import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fredy2/api/auth/auth.dart' as auth;
import 'package:fredy2/api/auth/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _mailController;
  late TextEditingController _pwController;

  @override
  void initState() {
    super.initState();
    _mailController = TextEditingController();
    _pwController = TextEditingController();
  }
  @override
  void dispose() {
    _mailController.dispose();
    _pwController.dispose();
    super.dispose();
  }

  void login() async {
    LoginModel loginModel;
    try {
      loginModel = await auth.login(
          _mailController.text, _pwController.text);
    } catch(e) {
      // Show error
      return;
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("access_token", loginModel.accessToken);
    prefs.setString("refresh_token", loginModel.refreshToken);
    prefs.setString("username", loginModel.username);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        backgroundColor: theme.colorScheme.background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Login',
                style: theme.textTheme.displayLarge,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * .3),
                child: Column(children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Nutzername *",
                      icon: Icon(Icons.account_circle_outlined),
                    ),
                    controller: _mailController,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Password *",
                      icon: Icon(Icons.password_rounded),
                    ),
                    obscureText: true,
                    controller: _pwController,
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: login, child: const Text('Login')),
                      const TextButton(
                          onPressed: null, child: Text('Register')),
                    ],
                  )
                ]),
              )
            ],
          ),
        ));;
  }
}

import 'package:flutter/material.dart';
import 'package:fredy2/api/auth/auth.dart' as auth;
import 'package:fredy2/api/auth/models.dart';
import 'package:fredy2/utils/utils.dart';

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

  Future<void> login() async {
    LoginModel loginModel =
        await auth.login(_mailController.text, _pwController.text);
    saveLoginCreds(loginModel);
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
                style: theme.textTheme.displayMedium,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * .3),
                child: Column(children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Mail *",
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
                          onPressed: () => {
                                login()
                                    .then((value) =>
                                        Navigator.pushNamedAndRemoveUntil(
                                            context, "/", (route) => false))
                                    .catchError((err) =>
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(err.toString()),
                                          backgroundColor: Colors.red,
                                        )))
                              },
                          child: const Text('Login')),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/register");
                          },
                          child: const Text('Register')),
                    ],
                  )
                ]),
              )
            ],
          ),
        ));
  }
}

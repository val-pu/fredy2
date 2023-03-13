import 'package:flutter/material.dart';
import 'package:fredy2/api/auth/auth.dart' as auth;
import 'package:fredy2/api/auth/models.dart';
import 'package:fredy2/utils/utils.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController _mailController;
  late TextEditingController _pwController;
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _mailController = TextEditingController();
    _pwController = TextEditingController();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _mailController.dispose();
    _pwController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  Future<void> register() async {
    await auth.register(
        _mailController.text, _pwController.text, _nameController.text);
    LoginModel loginModel =
        await auth.login(_mailController.text, _pwController.text);
    saveLoginCreds(loginModel);
  }

  void showLoginPage() async {
    Navigator.pushNamed(context, "/login");
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Register"),
        ),
        backgroundColor: theme.colorScheme.background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Register',
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
                      labelText: "Username *",
                      icon: Icon(Icons.person),
                    ),
                    controller: _nameController,
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
                          onPressed: showLoginPage, child: const Text('Login')),
                      TextButton(
                        onPressed: () {
                          register()
                              .then((value) => {
                                    Navigator.pushNamedAndRemoveUntil(
                                        context, "/landing", (route) => false)
                                  })
                              .catchError((error) => {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text(error)))
                                  });
                        },
                        child: const Text('Register'),
                      ),
                    ],
                  )
                ]),
              )
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:fredy2/landingpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fredy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void onLogin() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LandingPage()));
  }

  @override
  Widget build(BuildContext context) {
    double _paddingEditText = 0.0;
    ThemeData theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
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
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Password *",
                      icon: Icon(Icons.password_rounded),
                    ),
                    obscureText: true,
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: onLogin, child: const Text('Login')),
                      TextButton(
                          onPressed: onLogin, child: const Text('Register')),
                    ],
                  )
                ]),
              )
            ],
          ),
        ));
  }
}

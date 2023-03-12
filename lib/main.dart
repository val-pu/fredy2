import 'package:flutter/material.dart';
import 'package:fredy2/api/auth/models.dart';
import 'package:fredy2/screens/landingpage.dart';
import 'package:fredy2/screens/groups/grouppage.dart';
import 'package:fredy2/screens/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api/auth/auth.dart';

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

  Future<bool> loadStartup() async {
    String? accessToken =
        (await SharedPreferences.getInstance()).getString("access_token");
    return accessToken != null;
  }

  @override
  Widget build(BuildContext context) {
    double _paddingEditText = 0.0;

    return FutureBuilder<bool>(
        future: loadStartup(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          if (snapshot.data ?? false) {
            return GroupPage(groupId: "abc");
          }
          return const LoginPage();
        });
  }
}

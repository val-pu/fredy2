import 'package:flutter/material.dart';
import 'package:fredy2/screens/landingpage.dart';
import 'package:fredy2/screens/groups/grouppage.dart';
import 'package:fredy2/screens/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fredy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: const ColorScheme.dark(
          primary: Colors.blue,
          secondary: Colors.yellow,
          background: Colors.white10
        ),
      ),
      routes: {
        "/": (context) => LandingPage(),
        "/login": (context) => const LoginPage(),
      },
      initialRoute: "/login",
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

import 'package:flutter/material.dart';
import 'package:fredy2/screens/join_group.dart';
import 'package:fredy2/screens/landingpage.dart';
import 'package:fredy2/screens/login/login.dart';
import 'package:fredy2/screens/settings.dart';
import 'package:fredy2/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fredy2/api/auth/auth.dart' as auth;

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
            error: Colors.red,
            background: Colors.white10),
      ),
      routes: {
        "/": (context) => const MyHomePage(),
        "/login": (context) => const LoginPage(),
        "/landing": (context) => const LandingPage(),
        "/join": (context) => const JoinGroupPage(),
        "/settings": (context) => const Settings(),
      },
      initialRoute: "/",
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  Future<bool> loadStartup() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString("access_token");
    if (accessToken == null) {
      return false;
    }
    String? dtString = prefs.getString("access_token_expires");
    String? refreshToken = prefs.getString("refresh_token");

    if (dtString == null && refreshToken == null) {
      return false;
    }

    if (dtString == null ||
        DateTime.now().difference(DateTime.parse(dtString)) <
            const Duration(hours: 1)) {
      if (refreshToken == null) {
        return false;
      }
      var loginModel = await auth.refresh(refreshToken);
      saveLoginCreds(loginModel);
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    loadStartup()
        .then((value) => {
              if (value == true)
                {Navigator.pushReplacementNamed(context, "/landing")}
              else
                {Navigator.pushReplacementNamed(context, "/login")}
            })
        .catchError(() => Navigator.pushReplacementNamed(context, "/login"));
    return const Center(child: CircularProgressIndicator());
  }
}

/*

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }
}
*/

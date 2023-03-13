import 'package:flutter/material.dart';
import 'package:fredy2/screens/groups/create_group.dart';
import 'package:fredy2/screens/groups/grouppage.dart';
import 'package:fredy2/screens/groups/join_group.dart';
import 'package:fredy2/screens/landingpage.dart';
import 'package:fredy2/screens/login/login.dart';
import 'package:fredy2/screens/login/register.dart';
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
        ),
      ),
      routes: {
        "/": (context) => const MyHomePage(),
        "/login": (context) => const LoginPage(),
        "/register": (context) => const RegisterPage(),
        "/landing": (context) => const LandingPage(),
        "/join": (context) => const JoinGroupPage(),
        "/settings": (context) => const Settings(),
        "/group": (context) => const GroupPage(),
        "/creategroup": (context)=> const CreateGroupPage(),
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
    loadStartup().then((value) {
      String route;
      if (value == true) {
        route = "/landing";
      } else {
        route = "/login";
      }
      Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
    }).catchError((err) =>
        Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false));
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

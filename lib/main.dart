import 'package:flutter/material.dart';
import 'package:week12_sec130_weather_project/first_screen.dart';
import 'package:week12_sec130_weather_project/signup.dart';
import 'package:week12_sec130_weather_project/utility/MyStyle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: SplashScreen(),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: MyStyle().showTextTitle("Weather System"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyStyle().myLogo(),
              MyStyle().mySpace(),
              MyStyle().showTextHeader('Rangsit University'),
              MyStyle().mySpace(),
              userForm(),
              MyStyle().mySpace(),
              passwordForm(),
              MyStyle().mySpace(),
              btnLogin(),
              MyStyle().mySpace(),
              btnSignup(),
            ],
          ),
        ),
      ),
    );
  }

  TextButton btnSignup() {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SignUp(),
          ),
        );
      },
      child: const Text(
        'Sign up in Rangsit University',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.pink,
        ),
      ),
    );
  }

  Container btnLogin() {
    return Container(
      width: 250,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.lightBlue,
        ),
        onPressed: () {},
        child: const Text(
          "Login",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Container userForm() {
    return Container(
      width: 250,
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.account_circle_outlined,
            color: Colors.blue,
          ),
          labelText: 'User : ',
          labelStyle: const TextStyle(
            color: Colors.blue,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue.shade900,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.pink.shade900,
            ),
          ),
        ),
      ),
    );
  }

  Container passwordForm() {
    return Container(
      width: 250,
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.lock,
            color: Colors.blue,
          ),
          labelText: 'Password : ',
          labelStyle: const TextStyle(
            color: Colors.blue,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue.shade900,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.pink.shade900,
            ),
          ),
        ),
      ),
    );
  }
}

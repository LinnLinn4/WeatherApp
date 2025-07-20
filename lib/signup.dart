import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:week12_sec130_weather_project/utility/MyStyle.dart';

class SignUp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SignUpState();
  }
}

class _SignUpState extends State<SignUp>{
  String _userId = "";
  String _name = "";
  String _username = "";
  String _password = "";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: MyStyle().showTextTitle("Sign up"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(30.0),
        children: [
          signupLogo(),
          MyStyle().mySpace(),
          showOrgName(),
          MyStyle().mySpace(),
          userIdForm(),
          MyStyle().mySpace(),
          nameForm(),
          MyStyle().mySpace(),
          userForm(),
          MyStyle().mySpace(),
          passwordForm(),
          MyStyle().mySpace(),
          btnSignUp(),
        ],
      ),
    );
  }

  Row showOrgName() {
    return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyStyle().showTextHeader("Rangsit University"),
          ],
        );
  }

  Row signupLogo() {
    return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyStyle().myLogo(),
          ],
        );
  }

  Container userIdForm() {
    return Container(
      width: 250,
      child: TextField(
        onChanged: (value) => _userId = value,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.numbers_outlined,
            color: Colors.blue,
          ),
          labelText: 'User ID : ',
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

  Container userForm() {
    return Container(
      width: 250,
      child: TextField(
        onChanged: (value) => _username = value,
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

  Container nameForm() {
    return Container(
      width: 250,
      child: TextField(
        onChanged: (value) => _name = value,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.account_circle_outlined,
            color: Colors.blue,
          ),
          labelText: 'Name : ',
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
        onChanged: (value) => _password = value,
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

  Container btnSignUp() {
    return Container(
      width: 250,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.lightBlue,
        ),
        onPressed: () async{
          SharedPreferences prefs = await SharedPreferences.getInstance();
          bool add_status = await prefs.setString(_userId, "$_name, $_username, $_password");
          print("124");
          if (add_status){
            print("Done");
          }
        },
        child: const Text(
          "Sign Up",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
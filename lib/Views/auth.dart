import 'package:flutter/material.dart';
import 'package:flutter_sqlite_auth_app/Components/button.dart';
import 'package:flutter_sqlite_auth_app/Components/colors.dart';
import 'package:flutter_sqlite_auth_app/Views/login.dart';
import 'package:flutter_sqlite_auth_app/Views/signup.dart';
import 'package:flutter_sqlite_auth_app/Views/Admin.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Mental Health App",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: primaryColor),
                  ),
                  Expanded(child: Image.asset("assets/images/logo.jpeg")),
                  Button(label: "LOGIN", press: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
                  }),
                  Button(label: "SIGNUP", press: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignupScreen()));
                  }),
                ],
              ),
            ),
          )),
    );
  }
}
import 'package:amble/screens/auth/login_screen.dart';
import 'package:amble/screens/auth/signup_screen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return isLogin
        ? LoginScreen(onClickedSignUp: toggle)
        : SignUpScreen(onClickedSignIn: toggle);
  }

  void toggle() {
    return setState(() {
      isLogin = !isLogin;
    });
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// ignore: library_prefixes
import 'package:email_validator/email_validator.dart' as emailValidator;

import '../../main.dart';
import 'utils.dart';

class SignUpScreen extends StatefulWidget {
  final Function() onClickedSignIn;

  const SignUpScreen({
    Key? key,
    required this.onClickedSignIn,
  }) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.lightGreen[700],
        centerTitle: true,
        elevation: 0,
        title: const Text('SignUp'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.lightGreen[700],
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo/amble.png',
                  fit: BoxFit.fitHeight,
                  width: double.infinity,
                  height: 150,
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  color: Colors.lightGreen[50],
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        controller: nameController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          labelStyle: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          fillColor: Colors.white.withOpacity(0.2),
                          filled: true,
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: ((value) {
                          return value != null && value.length < 6
                              ? 'Minimum 6 characters required'
                              : null;
                        }),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        controller: emailController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          fillColor: Colors.white.withOpacity(0.2),
                          filled: true,
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: ((email) {
                          return email != null &&
                                  !emailValidator.EmailValidator.validate(email)
                              ? 'Enter a valid email'
                              : null;
                        }),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        controller: passwordController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          fillColor: Colors.white.withOpacity(0.2),
                          filled: true,
                        ),
                        obscureText: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: ((value) {
                          return value != null && value.length < 6
                              ? 'Minimum 6 characters required'
                              : null;
                        }),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        controller: confirmPasswordController,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          labelStyle: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          fillColor: Colors.white.withOpacity(0.2),
                          filled: true,
                        ),
                        obscureText: true,
                        autovalidateMode: AutovalidateMode.always,
                        validator: ((value) {
                          return value != null &&
                                  value != passwordController.text.toString()
                              ? 'Passwords do not match'
                              : null;
                        }),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          minimumSize: const Size.fromHeight(50),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        icon: const Icon(
                          Icons.arrow_forward,
                          size: 25,
                          color: Colors.white,
                        ),
                        label: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: signUp,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: TextSpan(
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            text: "Already Have an Account? - ",
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = widget.onClickedSignIn,
                                text: 'Login',
                                style: const TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  'assets/images/ambletree.jpg',
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                  height: 220,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future createUser({required String name, required String email}) async {
    final docUser = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid);
    final json = {
      'name': name,
      'email': email,
    };
    await docUser.set(json);
  }

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
      context: context,
      builder: ((context) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  'Creating Account and Signing In...',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                CircularProgressIndicator(),
              ],
            ),
          ),
        );
      }),
    );
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: confirmPasswordController.text.trim(),
      );
      createUser(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
    }

    navigatorKey.currentState!.popUntil(
      (route) => route.isFirst,
    );
  }
}

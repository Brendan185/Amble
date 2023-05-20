import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../auth/utils.dart';

class ContactUsScreen extends StatefulWidget {
  static const routeName = '/contact-us-screen';

  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final subjectController = TextEditingController();
  final noteController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      controller: nameController,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: 'Name',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: Colors.grey.withOpacity(0.2),
        filled: true,
      ),
      maxLength: 20,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Name Required';
        }
        return null;
      },
    );
  }

  Widget _buildEmail() {
    if (FirebaseAuth.instance.currentUser!.isAnonymous) {
      return TextFormField(
          controller: emailController,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            fillColor: Colors.grey.withOpacity(0.2),
            filled: true,
          ),
          maxLength: 50,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: ((email) {
            return email != null && !EmailValidator.validate(email)
                ? 'Enter a valid email'
                : null;
          }));
    } else {
      return Stack(
        children: [
          Container(
            width: double.infinity,
            height: 55,
            //color: Colors.grey,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Colors.indigo,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              color: Colors.grey.withOpacity(0.3),
            ),
            child: Center(
              child: Text(
                FirebaseAuth.instance.currentUser!.email.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: -2,
            left: 7,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                padding: const EdgeInsets.only(
                  left: 4,
                  right: 4,
                  top: 2,
                  bottom: 2,
                ),
                color: Colors.purple,
                child: const Text(
                  'Email',
                  style: TextStyle(
                    backgroundColor: Colors.purple,
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }
  }

  Widget _buildSubject() {
    return TextFormField(
      controller: subjectController,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: 'Subject',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: Colors.grey.withOpacity(0.2),
        filled: true,
      ),
      maxLength: 15,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Subject Required';
        }
        return null;
      },
    );
  }

  Widget _buildNote() {
    return TextFormField(
      controller: noteController,
      textInputAction: TextInputAction.done,
      maxLines: 5,
      decoration: InputDecoration(
        labelText: 'Note',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: Colors.grey.withOpacity(0.2),
        filled: true,
      ),
      maxLength: 200,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Note Required';
        }
        return null;
      },
    );
  }

  Future createForm({
    required String name,
    required String email,
    required String subject,
    required String note,
  }) async {
    final docUser = FirebaseFirestore.instance.collection('forms').doc();
    final json = {
      'name': name,
      'email': email,
      'subject': subject,
      'note': note,
    };
    await docUser.set(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(18),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildName(),
                const SizedBox(
                  height: 7,
                ),
                _buildEmail(),
                const SizedBox(
                  height: 27,
                ),
                _buildSubject(),
                const SizedBox(
                  height: 7,
                ),
                _buildNote(),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final isValid = _formKey.currentState!.validate();
                    if (!isValid) return;
                    final String? email;

                    showDialog(
                      useRootNavigator: false,
                      context: context,
                      builder: ((context) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                    );
                    try {
                      if (FirebaseAuth.instance.currentUser!.isAnonymous) {
                        email = emailController.text.trim();
                      } else {
                        email =
                            FirebaseAuth.instance.currentUser!.email.toString();
                      }
                      await createForm(
                        name: nameController.text.trim(),
                        email: email,
                        subject: subjectController.text.trim(),
                        note: noteController.text.trim(),
                      );
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pop();
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Center(
                            heightFactor: 2,
                            child: Text(
                              'Form Submitted. We will be in contact soon.',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          backgroundColor: Colors.grey,
                          elevation: 10,
                          duration: Duration(seconds: 3),
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.all(20),
                        ),
                      );
                      setState(() {
                        nameController.clear();
                        subjectController.clear();
                        noteController.clear();
                        emailController.clear();
                      });
                    } on Exception catch (e) {
                      Utils.showSnackBar(e.toString());
                    }
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

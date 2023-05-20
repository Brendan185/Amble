import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/user-screen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference user = FirebaseFirestore.instance.collection('users');
    String? docId = FirebaseAuth.instance.currentUser!.uid.toString();

    return FutureBuilder<DocumentSnapshot>(
      future: user.doc(docId).get(),
      builder: ((context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.none ||
            snapshot.connectionState == ConnectionState.active ||
            snapshot.connectionState == ConnectionState.waiting ||
            !snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Profile'),
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Profile'),
              ),
              body: Padding(
                padding: const EdgeInsets.only(
                  top: 25,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(140),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 10,
                                    blurRadius: 5,
                                    //offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Stack(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.lightGreen[700],
                                    radius: 90,
                                    child: Icon(
                                      color: Colors.white,
                                      Icons.person,
                                      size: 70,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 4,
                                    child: InkWell(
                                      onTap: () {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'This Feature has been disabled by the admin',
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                            backgroundColor: Colors.grey,
                                            elevation: 10,
                                            duration: Duration(seconds: 3),
                                            behavior: SnackBarBehavior.floating,
                                            margin: EdgeInsets.all(20),
                                          ),
                                        );
                                      },
                                      child: ClipOval(
                                        child: Container(
                                          color: Colors.white,
                                          padding: const EdgeInsets.all(
                                            3,
                                          ),
                                          child: ClipOval(
                                            child: Container(
                                              padding: const EdgeInsets.all(
                                                8,
                                              ),
                                              color: Colors.red,
                                              child: const Icon(
                                                Icons.edit,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Container(
                              width: double.infinity,
                              height: 40,
                              //color: Colors.grey,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: Colors.lightGreen.shade700,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Colors.grey.withOpacity(0.3),
                              ),
                              child: Center(
                                child: Text(
                                  data['name'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Container(
                              width: double.infinity,
                              height: 40,
                              //color: Colors.grey,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: Colors.lightGreen.shade700,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Colors.grey.withOpacity(0.3),
                              ),
                              child: Center(
                                child: Text(
                                  data['email'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Profile'),
              ),
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        }
      }),
    );
  }
}

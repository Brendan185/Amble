import 'package:flutter/material.dart';

class PoliciesScreen extends StatelessWidget {
  static const routeName = '/policies-screen';
  const PoliciesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Policies'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Divider(
            height: 5,
          ),
          ListTile(
            title: const Text(
              'Privacy Policy',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            tileColor: Colors.grey,
            contentPadding: const EdgeInsets.all(15),
            onTap: () {},
          ),
          const Divider(height: 5),
          ListTile(
            title: const Text(
              'Other Policy',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            tileColor: Colors.grey,
            contentPadding: const EdgeInsets.all(15),
            onTap: () {},
          )
        ],
      ),
    );
  }
}

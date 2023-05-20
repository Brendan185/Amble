import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  static const  routeName = '/about-us-screen';
    AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:   Text('About Us'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding:   EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo/amble.png',
                  fit: BoxFit.fitHeight,
                  width: double.infinity,
                  height: 150,
                  color: Colors.lightGreen.shade700,
                ),
                  SizedBox(
                  height: 30,
                ),
                Text(
                  textAlign: TextAlign.center,
                  'At Urban Data Design our mission is to create digital products and services people love to make our world a better place to live.  ',
                  style: TextStyle(
                    color: Colors.red,
                    fontFamily: 'Georgia',
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0,
                    wordSpacing: 3,
                    fontSize: 15,
                  ),
                ),
                  SizedBox(
                  height: 40,
                  child:   Divider(
                    thickness: 1,
                    color: Colors.black,
                    indent: 1,
                    endIndent: 1,
                  ),
                ),
                Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blue,
                      fontFamily: 'Georgia',
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0,
                      wordSpacing: 3,
                      fontSize: 15,
                    ),
                    'We aim to make our urban neighbourhoods thriving ‘hubs’ of healthy lifestyles and natural biodiversity.'),
                  SizedBox(
                  height: 40,
                  child:   Divider(
                    thickness: 1,
                    color: Colors.black,
                    indent: 1,
                    endIndent: 1,
                  ),
                ),
                  Text(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.green,
                      fontFamily: 'Georgia',
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0,
                      wordSpacing: 3,
                      fontSize: 15,
                    ),
                    'We’re creating Amble, an open spaces discovery app that offers a range of outdoor experiences specific to your needs, wants and desires. With Amble we help improve people’s mental well-being through quality interactions with community and nature. '),
                  SizedBox(
                  height: 40,
                  child:   Divider(
                    thickness: 1,
                    color: Colors.black,
                    indent: 1,
                    endIndent: 1,
                  ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.indigo,
                    fontFamily: 'Georgia',
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0,
                    wordSpacing: 3,
                    fontSize: 15,
                  ),
                  'Contact us if you’d like to be part of the Amble journey or share your best outdoor Amble experience.',
                ),
                  SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

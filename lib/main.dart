// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Portfolio",
      home: Home(),
      theme: ThemeData(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mohamed Ali"),
        leading: Icon(Icons.ac_unit_sharp),
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsetsDirectional.only(
                top: 20,
                bottom: 20,
              ),
              child: CircleAvatar(
                radius: 120,
                backgroundImage: AssetImage("images/1.jpg"),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 2,
              ),
              constraints: BoxConstraints(minHeight: 20, maxHeight: 200),
              child: Text(
                "Mohamed Ali",
                textAlign: TextAlign.center,
                style: GoogleFonts.rammettoOne(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              height: 30,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: Text(
                "Flutter Developer",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              constraints: BoxConstraints(minHeight: 20, maxHeight: 200),
              height: 30,
            ),
            ContactCard(
              contact: "+201030307088",
              //      url: "tel:+201555786787",
              iconData: Icons.phone,
              url: "tel:+201030307088",
            ),
            ContactCard(
              contact: "Mohamed.Ali.Awad",
              iconData: FontAwesomeIcons.facebook,
              url: "https://www.facebook.com/MR.Mohamed.ali.awad/",
            ),
            ContactCard(
              contact: "Mohamed.ali.awad2018@gmail.co",
              iconData: FontAwesomeIcons.mailBulk,
              url: "mailto:mohamed.ali.awad2018@gmail.com",
            ),
            ContactCard(
              contact: "Mohamed Ali",
              iconData: FontAwesomeIcons.github,
              url: "https://github.com/MohamedAliAwad",
            ),
          ],
        ),
      )),
    );
  }
}

class ContactCard extends StatelessWidget {
  final String contact, url;
  final IconData iconData;
  // ignore: use_key_in_widget_constructors
  const ContactCard(
      {required this.contact, required this.iconData, required this.url});

  void _launchURL(String _url) async {
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.blueGrey,
      child: ListTile(
        onTap: () {
          _launchURL(url);
        },
        leading: Icon(
          iconData,
          color: Colors.black,
          size: 30,
        ),
        title: Text(
          contact,
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
    );
  }
}

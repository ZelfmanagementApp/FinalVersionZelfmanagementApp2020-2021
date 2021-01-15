//Navigatie menu binnen de informatieschermen

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authenticatie/main.dart';
import 'package:flutter_authenticatie/screens/Klachtenscherm/KlachtenScreen.dart';
import 'package:flutter_authenticatie/screens/profiel/Profiel.dart';
import 'package:flutter_authenticatie/screens/chat_en_Forum/Forum/Forum.dart';
import 'package:flutter_authenticatie/screens/grafieken/grafieken_homescreen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';
import 'package:flutter_authenticatie/screens/InfoScreen/Infoscreens/wat.dart';
import 'package:flutter_authenticatie/screens/InfoScreen/Infoscreens/Oorzaak.dart';
import 'package:flutter_authenticatie/screens/InfoScreen/Infoscreens/Symptomen.dart';
import 'package:flutter_authenticatie/screens/InfoScreen/Infoscreens/Prognose.dart';
import 'package:flutter_authenticatie/screens/InfoScreen/Infoscreens/Behandeling.dart';
import 'package:flutter_authenticatie/screens/InfoScreen/Infoscreens/Klachten_na_behandeling.dart';
import 'package:flutter_authenticatie/screens/InfoScreen/Infoscreens/Nazorg.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Image.asset("assets/images/logo.jpg"), // 2
          centerTitle: true,
          actions: [
            IconButton(
              icon: SvgPicture.asset("assets/icons/speaker.svg"),
              color: kPrimaryLightColor,
              onPressed: () {}, // moet nog geluid worden toegevoegd
            ),
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          height: 70,
          animationDuration: Duration(microseconds: 400),
          backgroundColor: kPrimaryColor,
          items: [
            Icon(Icons.mode_edit),
            Icon(Icons.chat),
            Icon(Icons.home),
            Icon(Icons.person),
            Icon(Icons.assessment),
          ],
          onTap: (index) {
            setState(() {
              if (index == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Klacht()),
                );
              } else if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Forum()),
                );
              } else if (index == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              } else if (index == 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profiel()),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GrafiekenHomescreen()),
                );
              }
            });
          },
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/erasmus1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Text("Baarmoederkanker informatiepagina",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          color: Colors.blue[900],
                          fontSize: 20,
                          fontWeight: FontWeight.w600))),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                width: 225.0,
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(29.0))),
                  child: Text(
                    'Wat is het?',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: kPrimaryColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Wat()),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                width: 225.0,
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(29.0))),
                  child: Text(
                    'Oorzaak',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: kPrimaryColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Oorzaak()),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                width: 225.0,
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(29.0))),
                  child: Text(
                    'Symptomen',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: kPrimaryColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Symptomen()),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                width: 225.0,
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(29.0))),
                  child: Text(
                    'Prognose',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: kPrimaryColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Prognose()),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                width: 225.0,
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(29.0))),
                  child: Text(
                    'Behandeling',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: kPrimaryColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Behandeling()),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                width: 225.0,
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(29.0))),
                  child: Text(
                    'Klachten na behandeling',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: kPrimaryColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Klachten()),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                width: 225.0,
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(29.0))),
                  child: Text(
                    'Nazorg',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: kPrimaryColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Nazorg()),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

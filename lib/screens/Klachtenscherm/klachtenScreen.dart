//Homescreen klachtenpagina, vanaf hier wordt er opgesplitst naar soort klacht op basis van therapie.

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authenticatie/screens/chat_en_Forum/Forum/Forum.dart';
import 'package:flutter_authenticatie/screens/grafieken/grafieken_homescreen.dart';
import 'package:flutter_authenticatie/screens/profiel/Profiel.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';
import 'package:flutter_authenticatie/screens/Klachtenscherm/klachtenvervolgscreens/Vervolg_ziektenbeeld.dart';
import 'package:flutter_authenticatie/screens/Klachtenscherm/klachtenvervolgscreens/Vervolg_radiotherapie.dart';
import 'package:flutter_authenticatie/screens/Klachtenscherm/klachtenvervolgscreens/Vervolg_hormoontherapie.dart';
import 'package:flutter_authenticatie/screens/Klachtenscherm/klachtenvervolgscreens/Vervolg_plaatsenlijk.dart';
import 'package:flutter_authenticatie/screens/Klachtenscherm/klachtenvervolgscreens/Vervolg_chemotherapie.dart';
import '../../main.dart';

class Klacht extends StatefulWidget {
  @override
  _KlachtState createState() => _KlachtState();
}

class _KlachtState extends State<Klacht> {
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
              onPressed: () {}, // omitting onPressed makes the button disabled
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
                  MaterialPageRoute(
                      builder: (context) => GrafiekenHomescreen()),
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
              SizedBox(
                height: 15.0,
              ),
              Text("Gezondheidsregistratie",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          color: Colors.blue[900],
                          fontSize: 20,
                          fontWeight: FontWeight.w600))),
              Text(''),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                width: 325.0,
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(29.0))),
                  child: Text(
                    'Klachten gerelateerd aan ziektebeeld',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  color: kPrimaryColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VervolgZiektenbeeld()),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                width: 325.0,
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(29.0))),
                  child: Text(
                    'Klachten na chemotherapie',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  color: kPrimaryColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VervolgChemotherapie()),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                width: 325.0,
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(29.0))),
                  child: Text(
                    'Klachten na radiotherapie',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  color: kPrimaryColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VervolgRadiotherapie()),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                width: 325.0,
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(29.0))),
                  child: Text(
                    'Klachten na hormoontherapie',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  color: kPrimaryColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VervolgHormoontherapie()),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                width: 325.0,
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(29.0))),
                  child: Text(
                    'Klachten na plaatselijke operatie',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  color: kPrimaryColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VervolgPlaatsenlijk()),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

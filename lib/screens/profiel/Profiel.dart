//Inspiratie https://doctorcodetutorial.blogspot.com/2020/04/make-profile-page-in-flutter-ui.html en onze Adobe XD Schetsen
//Uiteraard moet profiel deels automatisch gemaakt gaan worden, zoals bijv. naam.
//Uiteraard moeten de aantal meldingen etc. geautomtiseerd worden.

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authenticatie/constants.dart';
import 'package:flutter_authenticatie/screens/Klachtenscherm/klachtenScreen.dart';
import 'package:flutter_authenticatie/screens/grafieken/grafieken_homescreen.dart';
import 'package:flutter_authenticatie/screens/chat_en_Forum/Forum/Forum.dart';
import 'package:flutter_authenticatie/screens/profiel/instellingen.dart';
import 'package:flutter_svg/svg.dart';

import '../../main.dart';

class Profiel extends StatefulWidget {
  @override
  _ProfielState createState() => _ProfielState();
}

class _ProfielState extends State<Profiel> {
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
            onPressed: () {}, // geluidsbestand nog toevoegen
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
      body: Column(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [kPrimaryColor, kPrimaryLightColor])),
              child: Container(
                width: double.infinity,
                height: 280.0,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        child: Image.asset('assets/images/profile_pic.jpg'),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        "Laura de Wilde", //moet variabele van de naam van de gebruiker worden
                        style: TextStyle(
                          fontSize: 26.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.white,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 22.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Aantal klachten: ",
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "3",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: kPrimaryColor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Reacties Forum:",
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "2",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: kPrimaryColor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
          Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Ziektenbeeld(en):",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    '- Baarmoederhalskanker\n',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w300,
                      color: kPrimaryColor,
                      letterSpacing: 2.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            width: 300.00,
            child: RaisedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Instellingen()),
                );
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(29))),
              label: Text(
                'Instellingen',
                style: TextStyle(color: Colors.white, fontSize: 26.0),
              ),
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              textColor: Colors.white,
              splashColor: kPrimaryLightColor,
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

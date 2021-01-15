//Navigatie menu binnen de informatieschermen
//De mogelijkheden zouden automatisch geladen moeten worden op basis van de klachten die worden ingevuld.
//Daarnaast zou je in eerste instante 1 lijn moeten zien per klachtenknop

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authenticatie/main.dart';
import 'package:flutter_authenticatie/screens/Klachtenscherm/KlachtenScreen.dart';
import 'package:flutter_authenticatie/screens/profiel/Profiel.dart';
import 'package:flutter_authenticatie/screens/chat_en_Forum/Forum/Forum.dart';
import 'package:flutter_authenticatie/screens/grafieken/grafieken.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';

class GrafiekenHomescreen extends StatefulWidget {
  @override
  _GrafiekenHomescreenState createState() => _GrafiekenHomescreenState();
}

class _GrafiekenHomescreenState extends State<GrafiekenHomescreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width; //volledige scherm wijdte
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Druk op de gewenste klacht",
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 22,
                        fontWeight: FontWeight.w600))),
            Container(margin: EdgeInsets.only(bottom: 10.0)),
            opgezetteBenenButton(width),
            Container(margin: EdgeInsets.only(bottom: 10.0)),
            geheugenVerliesButton(width),
            Container(margin: EdgeInsets.only(bottom: 10.0)),
            concentratieproblemenButton(width),
            Container(margin: EdgeInsets.only(bottom: 10.0)),
            somberheidButton(width),
          ],
        ),
      ),
    );
  }

// button Widgets worden gemaakt hieronder
  Widget opgezetteBenenButton(double width) {
    return Expanded(
      child: SizedBox(
        width: width - 120,
        height: 10,
        child: RaisedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Grafiek()),
            );
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(29))),
          label: Text(
            'Opgezette benen',
            style: TextStyle(color: Colors.white),
          ),
          icon: SvgPicture.asset("assets/icons/been.svg"),
          textColor: Colors.white,
          splashColor: kPrimaryLightColor,
          color: kPrimaryColor,
        ),
      ),
    );
  }

  Widget geheugenVerliesButton(double width) {
    return Expanded(
      child: SizedBox(
        width: width - 120,
        height: 10,
        child: RaisedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Grafiek()),
            );
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(29.0))),
          label: Text(
            'Geheugenverlies',
            style: TextStyle(color: Colors.white),
          ),
          icon: SvgPicture.asset("assets/icons/headache.svg"),
          textColor: Colors.white,
          splashColor: kPrimaryLightColor,
          color: kPrimaryColor,
        ),
      ),
    );
  }

  Widget concentratieproblemenButton(double width) {
    return Expanded(
      child: SizedBox(
        width: width - 120,
        height: 10,
        child: RaisedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Grafiek()),
            );
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(29.0))),
          label: Text(
            'Concentratieproblemen',
            style: TextStyle(color: Colors.white),
          ),
          icon: SvgPicture.asset("assets/icons/fatigue.svg"),
          textColor: Colors.white,
          splashColor: kPrimaryLightColor,
          color: kPrimaryColor,
        ),
      ),
    );
  }

  Widget somberheidButton(double width) {
    return Expanded(
      child: SizedBox(
        width: width - 120,
        height: 10,
        child: RaisedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Grafiek()),
            );
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(29.0))),
          label: Text(
            'Somberheid',
            style: TextStyle(color: Colors.white),
          ),
          icon: SvgPicture.asset("assets/icons/somberheid.svg"),
          textColor: Colors.white,
          splashColor: kPrimaryLightColor,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}

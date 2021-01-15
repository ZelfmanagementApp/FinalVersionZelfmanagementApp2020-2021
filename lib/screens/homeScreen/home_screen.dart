//Dit is de homepage, waar het keuzemenu zal komen.
// Zo goed als af, maar er zouden nog audifiles toegevoegd moeten worden.
//Er is een werkende nederlandse audioknop toegevoegd in een los bestand.
//Maar vanwege de verschillende talen, zal het waarschijnlijk geautomatiseerd worden.

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authenticatie/constants.dart';
import 'package:flutter_authenticatie/screens/Klachtenscherm/KlachtenScreen.dart';
import 'package:flutter_authenticatie/screens/agenda/agenda.dart';
import 'package:flutter_authenticatie/screens/chat_en_Forum/Forum/Forum.dart';
import 'package:flutter_authenticatie/screens/grafieken/grafieken_homescreen.dart';
import 'package:flutter_authenticatie/services/authentication.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../InfoScreen/info.dart';
import '../profiel/Profiel.dart';
import 'package:flutter_authenticatie/screens/Vragenlijst/VragenlijstenScreen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.auth, this.userId, this.onSignedOut})
      : super(key: key);
  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _myController = TextEditingController();
  void dispose() {
    _myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width; //volledige scherm wijdte
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    final name = user.email;
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
          IconButton(
            icon: SvgPicture.asset("assets/icons/logout.svg"),
            color: kPrimaryLightColor,
            onPressed: () {
              _openSettings();
            },
          ),
        ],
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
            Text(
              '$name',
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      color: Colors.blue[900],
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            ),
            Text("Voor voorleeshulp, druk op de audioknop!",
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 14,
                        fontWeight: FontWeight.w600))),
            Container(margin: EdgeInsets.only(bottom: 10.0)),
            infoButton(width),
            Container(margin: EdgeInsets.only(bottom: 10.0)),
            klachtButton(width),
            Container(margin: EdgeInsets.only(bottom: 10.0)),
            chatButton(width),
            Container(margin: EdgeInsets.only(bottom: 10.0)),
            vragenlijstButton(width),
            Container(margin: EdgeInsets.only(bottom: 10.0)),
            grafiekenButton(width),
            Container(margin: EdgeInsets.only(bottom: 10.0)),
            profielButton(width),
            Container(margin: EdgeInsets.only(bottom: 10.0)),
            agendaButton(width)
          ],
        ),
      ),
    );
  }

// button Widgets worden gemaakt hieronder
  Widget infoButton(double width) {
    return Expanded(
      child: SizedBox(
        width: width - 120,
        height: 10,
        child: RaisedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Info()),
            );
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(29))),
          label: Text(
            'Info',
            style: TextStyle(color: Colors.white),
          ),
          icon: SvgPicture.asset("assets/icons/info.svg"),
          textColor: Colors.white,
          splashColor: kPrimaryLightColor,
          color: kPrimaryColor,
        ),
      ),
    );
  }

  Widget klachtButton(double width) {
    return Expanded(
      child: SizedBox(
        width: width - 120,
        height: 10,
        child: RaisedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Klacht()),
            );
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(29.0))),
          label: Text(
            'Welzijn',
            style: TextStyle(color: Colors.white),
          ),
          icon: SvgPicture.asset("assets/icons/pain.svg"),
          textColor: Colors.white,
          splashColor: kPrimaryLightColor,
          color: kPrimaryColor,
        ),
      ),
    );
  }

  Widget chatButton(double width) {
    return Expanded(
      child: SizedBox(
        width: width - 120,
        height: 10,
        child: RaisedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Forum()),
            );
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(29.0))),
          label: Text(
            'Chat en Forum',
            style: TextStyle(color: Colors.white),
          ),
          icon: SvgPicture.asset("assets/icons/message.svg"),
          textColor: Colors.white,
          splashColor: kPrimaryLightColor,
          color: kPrimaryColor,
        ),
      ),
    );
  }

  Widget vragenlijstButton(double width) {
    return Expanded(
      child: SizedBox(
        width: width - 120,
        height: 10,
        child: RaisedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VragenlijstHomePage()),
            );
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(29.0))),
          label: Text(
            'vragenlijst',
            style: TextStyle(color: Colors.white),
          ),
          icon: SvgPicture.asset("assets/icons/question.svg"),
          textColor: Colors.white,
          splashColor: kPrimaryLightColor,
          color: kPrimaryColor,
        ),
      ),
    );
  }

  Widget grafiekenButton(double width) {
    return Expanded(
      child: SizedBox(
        width: width - 120,
        height: 10,
        child: RaisedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GrafiekenHomescreen()),
            );
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(29.0))),
          label: Text(
            'grafieken',
            style: TextStyle(color: Colors.white),
          ),
          icon: SvgPicture.asset("assets/icons/graph.svg"),
          textColor: Colors.white,
          splashColor: kPrimaryLightColor,
          color: kPrimaryColor,
        ),
      ),
    );
  }

  Widget profielButton(double width) {
    return Expanded(
      child: SizedBox(
        width: width - 120,
        height: 10,
        child: RaisedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Profiel()),
            );
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(29.0))),
          label: Text(
            'profiel',
            style: TextStyle(color: Colors.white),
          ),
          icon: SvgPicture.asset("assets/icons/user.svg"),
          textColor: Colors.white,
          splashColor: kPrimaryLightColor,
          color: kPrimaryColor,
        ),
      ),
    );
  }

  Widget agendaButton(double width) {
    return Expanded(
      child: SizedBox(
        width: width - 120,
        height: 10,
        child: RaisedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Agenda()),
            );
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(29.0))),
          label: Text(
            'Agenda',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(
            Icons.insert_invitation,
            color: kPrimaryLightColor,
          ),
          textColor: Colors.white,
          splashColor: kPrimaryLightColor,
          color: kPrimaryColor,
        ),
      ),
    );
  }

// uitlog optie toegevoegd
  _signOut() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  void _openSettings() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          Size size = MediaQuery.of(context).size;
          return Scaffold(
              appBar: AppBar(
                title: Text('Uitloggen', style: TextStyle(color: Colors.white)),
                backgroundColor: kPrimaryColor,
              ),
              body: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/erasmus1.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/welkom.jpg",
                          height: size.height * 0.45,
                        ),
                        Container(
                          width: 325,
                          height: 40,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(29.0))),
                            child: Text(
                              'Uitloggen',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            color: kPrimaryColor,
                            onPressed: () {
                              _signOut();
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ])));
        },
      ),
    );
  }
}

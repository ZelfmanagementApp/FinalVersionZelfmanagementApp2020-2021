import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants.dart';
import 'package:url_launcher/url_launcher.dart';

const CURVE_HEIGHT = 160.0;
const AVATAR_RADIUS = CURVE_HEIGHT * 0.28;
const AVATAR_DIAMETER = AVATAR_RADIUS * 2;

class Klachten extends StatefulWidget {
  @override
  _KlachtenState createState() => _KlachtenState();
}

class _KlachtenState extends State<Klachten> {
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
              onPressed: () {}, // geluid toevoegen
            ),
          ],
        ),
        backgroundColor: kPrimaryLightColor,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: <Widget>[
            Text(
              'Klachten en gevolgen na behandeling\n',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              "Kanker en de behandeling ervan hebben vaak een grote invloed op het dagelijks leven. "
              "Sommige gevolgen hebben met de ziekte zelf te maken. Andere met de behandeling. "
              "Ook uw leeftijd en lichamelijke conditie spelen een rol.\n",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Gevolgen waar veel mensen met kanker mee te maken krijgen: "
              "vermoeidheid, geheugenverlies en concentratieproblemen, veranderingen in uw uiterlijk, angst voor terugkeer van de ziekte en somberheid.\n",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Ook kan baarmoederkanker de volgende specifieke gevolgen hebben:\n"
              "• Lymfoedeem\n"
              "• Onvruchtbaarheid\n"
              "• Seksualiteit \n",
              style: TextStyle(fontSize: 16),
            ),
            FloatingActionButton(
              onPressed: _launchURL,
              child: Icon(Icons.link),
            ),
          ]),
        ));
  }
}

//Opent de link naar de bron van de tekst.

_launchURL() async {
  const url = 'https://olijf.nl/gynaecologische-kankers/baarmoederkanker';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

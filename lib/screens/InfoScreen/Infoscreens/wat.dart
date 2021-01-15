import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants.dart';
import 'package:url_launcher/url_launcher.dart';

class Wat extends StatefulWidget {
  @override
  _WatState createState() => _WatState();
}

class _WatState extends State<Wat> {
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
              onPressed: () {}, //geluid toevoegen
            ),
          ],
        ),
        backgroundColor: kPrimaryLightColor,
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: <Widget>[
              Text(
                'Wat is baarmoederkanker?\n',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                "Baarmoederkanker is kanker van de baarmoeder. Bij 90 tot 95% gaat het"
                " om kanker van het baarmoederslijmvlies. Dit is een endometriumcarcinoom."
                " De andere 5 tot 10% tumoren in de baarmoeder is baarmoedersarcoom."
                " De informatie op deze pagina gaat over endometriumcarcinoom.\n",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Baarmoederkanker of baarmoederhalskanker? ",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              Text(
                "Baarmoederkanker is kanker in het baarmoederlichaam. Het baarmoederlichaam is het "
                "brede deel en het grootste deel van de baarmoeder. Baarmoederhalskanker is kanker die"
                " ontstaat in de baarmoederhals en/of de baarmoedermond. Zowel het ziekteverloop als de "
                "behandeling van beide ziekten zijn verschillend.",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16),
              ),
              FloatingActionButton(
                onPressed: _launchURL,
                child: Icon(Icons.link),
              ),
            ])));
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

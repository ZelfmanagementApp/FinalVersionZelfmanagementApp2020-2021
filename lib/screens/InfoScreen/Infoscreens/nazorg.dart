import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants.dart';
import 'package:url_launcher/url_launcher.dart';

class Nazorg extends StatefulWidget {
  @override
  _NazorgState createState() => _NazorgState();
}

class _NazorgState extends State<Nazorg> {
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
                'Nazorg\n',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                "Na de behandeling van baarmoederkanker blijft u onder controle bij de gynaecoloog: \n"
                "• De eerste 2 jaar elke 3 tot 4 maanden.\n"
                "• Na 2 jaar 2 tot 3 keer per jaar.\n"
                "• Na 5 jaar zijn geen verdere controles meer nodig.\n",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "De controles richten zich vooral op het onderzoeken, bespreken en behandelen van mogelijke bijwerkingen en gevolgen van de behandeling."
                " Ook onderzoekt de arts of de ziekte is teruggekomen.\n",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "De arts doet uitwendig en inwendig onderzoek en soms een vaginale echoscopie."
                " Ook onderzoekt hij de lymfeklieren in uw hals en liezen. Heeft u klachten, dan wordt u soms verder onderzocht, "
                "bijv. met een CT-scan.\n",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Verliest u bloed via de vagina, neem dan contact op met uw huisarts of specialist.\n",
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

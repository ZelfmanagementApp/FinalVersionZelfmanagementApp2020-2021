import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants.dart';
import 'package:url_launcher/url_launcher.dart';

class Prognose extends StatefulWidget {
  @override
  _PrognoseState createState() => _PrognoseState();
}

class _PrognoseState extends State<Prognose> {
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
                'Prognose\n',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                "Bij baarmoederkanker zijn er 4 stadia:\n"
                "• Stadium I: de tumor zit alleen in de baarmoeder.\n"
                "• Stadium II: de tumor is doorgegroeid tot in de baarmoederhals.\n"
                "• Stadium III: de tumor is verder doorgegroeid in de directe omgeving van de baarmoeder, zoals de eierstokken, vagina of lymfeklieren in het bekken.\n"
                "• Stadium IV: de tumor is doorgegroeid naar de blaas of endeldarm, of uitgezaaid naar andere organen.\n",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Met deze stadium-indeling schat de arts de vooruitzichten in en bepaalt hij de behandeling.\n",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Uitzaaiingen",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              Text(
                "Als baarmoederkanker uitzaait, is dat meestal via het lymfstelsel en minder vaak via het bloed."
                " Uitzaaiingen ontstaan dus vaak eerst in lymfeklieren. En pas later in andere organen zoals lever en longen.",
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

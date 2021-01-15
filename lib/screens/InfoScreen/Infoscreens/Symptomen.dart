import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants.dart';
import 'package:url_launcher/url_launcher.dart';

class Symptomen extends StatefulWidget {
  @override
  _SymptomenState createState() => _SymptomenState();
}

class _SymptomenState extends State<Symptomen> {
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
            child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //SingleChildScrollView(
                  Text(
                    'Symptomen\n',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Symptomen van baarmoederkanker kunnen zijn:\n"
                    "• Bloedverlies na de overgang.\n"
                    "• Onregelmatig en overmatig bloedverlies tussen de menstruaties door.\n"
                    "• Plasklachten of bloedverlies bij het plassen.\n"
                    "• Vermoeidheid, vermagering of buikpijn.\n",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Deze klachten kunnen ook andere oorzaken hebben, maar ga bij deze klachten altijd naar de huisarts.",
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

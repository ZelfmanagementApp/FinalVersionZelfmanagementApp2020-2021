import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants.dart';
import 'package:url_launcher/url_launcher.dart';

class Oorzaak extends StatefulWidget {
  @override
  _OorzaakState createState() => _OorzaakState();
}

class _OorzaakState extends State<Oorzaak> {
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
                    'Oorzaak van baarmoederkanker\n',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Over het ontstaan van baarmoederkanker is nog weinig bekend."
                    " De kans op baarmoederkanker lijkt groter zijn wanneer er lange tijd veel oestrogeen in het bloed aanwezig is.\n",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Dit is het geval wanneer u:\n"
                    "• Laat in de overgang komt.\n"
                    "• Geen kinderen heeft gekregen.\n"
                    "• Overgewicht heeft.\n"
                    "• Lange tijd oestrogenen gebruikt (bijvoorbeeld bij overgangsklachten)\n"
                    "• Een zeldzame oestrogeenproducerende tumor van de eierstokken heeft\n"
                    "• Borstkanker heeft gehad en een aantal jaren het medicijn tamoxifen gebruikt\n",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Een andere risicofactor voor baarmoederkanker is het Lynch-syndroom.\n",
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

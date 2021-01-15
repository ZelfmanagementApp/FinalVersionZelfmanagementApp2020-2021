import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants.dart';
import 'package:url_launcher/url_launcher.dart';

class Behandeling extends StatefulWidget {
  @override
  _BehandelingState createState() => _BehandelingState();
}

class _BehandelingState extends State<Behandeling> {
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
              onPressed: () {}, // geluid moet nog worden toegevoegd
            ),
          ],
        ),
        backgroundColor: kPrimaryLightColor,
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: <Widget>[
              Text(
                'Behandeling',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                "Is de diagnose baarmoederkanker vastgesteld?\n",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                "Dan kunt u de volgende behandelingen krijgen:\n"
                "• operatie\n"
                "• bestraling\n"
                "• Chemothermie\n"
                "• Hyperthermie\n",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Vaak krijgt u een combinatie van deze behandelingen.\n"
                "Naast deze therapieën kunt u soms deelnemen aan behandelingen in onderzoeksverband (trials).\n",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Uw behandelend arts bespreekt uw dossier met een team van gespecialiseerde artsen en verpleegkundigen."
                " Dit heet een multidisciplinair overleg (MDO)."
                " De specialisten maken samen een behandelplan voor u. Zij gebruiken hiervoor landelijke richtlijnen."
                " Een behandelplan is dus maatwerk. Laat u daarom goed informeren over de behandelmogelijkheden,"
                " zodat u samen met uw behandelteam een weloverwogen besluit kunt nemen.",
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

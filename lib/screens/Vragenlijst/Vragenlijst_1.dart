//Vragen moeten vanuit een database geladen worden.
//Er moet nog worden nagedacht over de manier waarop de antwoorden kunnen worden gekozen.
//Moeten bijv. nog chechboxes bij indien dit format wordt aangehouden

import 'package:flutter/material.dart';
import 'package:flutter_authenticatie/screens/homeScreen/home_screen.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';

class VragenlijstDemo extends StatefulWidget {
  @override
  _VragenlijstState createState() => new _VragenlijstState();
}

class _VragenlijstState extends State<VragenlijstDemo> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/erasmus1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          width: MediaQuery.of(context).size.width,
          child: new Column(
            children: <Widget>[
              new Center(
                child: new Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: new Text(
                    'Voorbeeld pagina met deel vragenlijst EORTC QLQ-C30',
                    style: new TextStyle(
                        fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              new Expanded(
                child: new ListView(
                  children: _buildCards(),
                  padding: const EdgeInsets.all(8.0),
                ),
              ),
              RaisedButton(
                color: kPrimaryLightColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(29.0))),
                child: Text("Ga terug naar homescreen"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
              ),
            ],
          ),
        ));
  }

  Widget _buildCard(CardModel card) {
    List<Widget> columnData = <Widget>[];

    if (card.isHeaderAvailable) {
      columnData.add(
        new Padding(
          padding: const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
          child: new Text(
            card.headerText,
            style: new TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
          ),
        ),
      );
    }

    for (int i = 0; i < card.allText.length; i++)
      columnData.add(
        new Text(
          card.allText[i],
          style: new TextStyle(fontSize: 22.0),
        ),
      );

    return new Card(
      child: new Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Column(children: columnData),
      ),
    );
  }

  List<Widget> _buildCards() {
    List<Widget> cards = [];
    for (int i = 0; i < sampleCards.length; i++) {
      cards.add(_buildCard(sampleCards[i]));
    }

    return cards;
  }
}

class CardModel {
  final String headerText;
  final List<String> allText;
  final bool isHeaderAvailable;

  CardModel(
      {this.headerText = "", this.allText, this.isHeaderAvailable = false});
}

List<CardModel> sampleCards = [
  new CardModel(
      isHeaderAvailable: true,
      headerText:
          "Vraag 1. Heeft U moeite met het doen van inspannende activiteiten zoals het dragen van een zware boodschappentas of een koffer?",
      allText: [
        "Helemaal niet",
        "een beetje",
        "nogal",
        "heel erg",
      ]),
  new CardModel(
      isHeaderAvailable: true,
      headerText:
          "Vraag 2. Heeft U moeite met het maken van een lange wandeling?",
      allText: [
        "Helemaal niet",
        "een beetje",
        "nogal",
        "heel erg",
      ]),
  new CardModel(
      isHeaderAvailable: true,
      headerText:
          "Vraag 3. Heeft u moeite met het maken van een korte wndeling buitenshuis",
      allText: [
        "Helemaal niet",
        "een beetje",
        "nogal",
        "heel erg",
      ]),
  new CardModel(
      isHeaderAvailable: true,
      headerText: "Vraag 4. Moet u overdag in bed of op een stoel blijven?",
      allText: [
        "Helemaal niet",
        "een beetje",
        "nogal",
        "heel erg",
      ]),
];

// Er wordt nog niks opgeslagen!

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authenticatie/screens/Klachtenscherm/klachteninvulScreen/Klachteninvoerscherm.dart';
import 'package:flutter_authenticatie/screens/grafieken/grafieken_homescreen.dart';
import 'package:flutter_authenticatie/screens/chat_en_Forum/Forum/Forum.dart';
import 'package:flutter_authenticatie/screens/profiel/Profiel.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants.dart';
import '../../../main.dart';
import '../klachtenScreen.dart';

class VervolgChemotherapie extends StatefulWidget {
  @override
  VervolgChemotherapieState createState() => new VervolgChemotherapieState();
}

class VervolgChemotherapieState extends State<VervolgChemotherapie> {
  Map<String, bool> values = {
    'Opgezette benen': false,
    'geheugenverlies': false,
    'Concentratieproblemen': false,
    'Somberheid': false,
    'Vaginale droogheid': false,
    'Overige': false,
  };

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
              onPressed: () {}, // Geluid moet nog worden toegevoegd.
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
                  MaterialPageRoute(
                      builder: (context) => GrafiekenHomescreen()),
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
            child: Column(children: <Widget>[
              SizedBox(
                height: 15.0,
              ),
              Text('Gezondheidsregistratie\n',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text('Klik het vakje bij de klacht aan die ingevuld moet worden:',
                  style: TextStyle(fontSize: 16)),
              Expanded(
                child: new ListView(
                  children: values.keys.map((String key) {
                    return new CheckboxListTile(
                      title: new Text(key),
                      value: values[key],
                      onChanged: (bool value) {
                        setState(() {
                          values[key] = value;
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Welzijn()),
                  );
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(29.0))),
                child: const Text('ga verder', style: TextStyle(fontSize: 20)),
              ),
            ])));
  }
}

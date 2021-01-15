//inspiratie -> https://www.youtube.com/watch?v=rcU8byf1TAk&t=8s&ab_channel=CodeX
//Hoofdpagina, de vragenlijsten die bij de database worden geupload zouden hier moeten verschijnen in een losse kaart.
//Optioneel is om de gehele kaart als button te gebruiken en er een check voor of na te zetten als de test gemaakt is.

import 'dart:ui' as ui;
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authenticatie/screens/Klachtenscherm/KlachtenScreen.dart';
import 'package:flutter_authenticatie/screens/chat_en_Forum/Forum/Forum.dart';
import 'package:flutter_authenticatie/screens/grafieken/grafieken.dart';
import 'package:flutter_authenticatie/screens/profiel/Profiel.dart';
import 'package:flutter_authenticatie/screens/Vragenlijst/Vragenlijst_1.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants.dart';
import '../../main.dart';

class VragenlijstHomePage extends StatefulWidget {
  VragenlijstHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _VragenlijstHomePageState createState() => _VragenlijstHomePageState();
}

class _VragenlijstHomePageState extends State<VragenlijstHomePage> {
  final double _borderRadius = 24;

  var items = [
    PlaceInfo('Vragenlijst 1.\n EORTC QLQ-C30', Color(0xff6DC8F3),
        Color(0xff73A1F9), 'Circa 10 t/m 15 min.'), //
    PlaceInfo(
        'Vragenlijst 2', Color(0xffFFB157), Color(0xffFFA057), 'Crica 20 min.'),
    PlaceInfo(
        'Vragenlijst 3', Color(0xffFF5B95), Color(0xffF8556D), 'Circa 10 min.'),
    PlaceInfo(
        'Vragenlijst 4', Color(0xffD76EF5), Color(0xff8F7AFE), 'Circa 10 min.'),
    PlaceInfo('Vragenlijs 5', Color(0xff42E695), Color(0xff3BB2B8),
        'Circa 20-25 min.'),
  ];

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
            onPressed: () {}, // geluidsbestand nog toevoegen
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
                MaterialPageRoute(builder: (context) => Grafiek()),
              );
            }
          });
        },
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(_borderRadius),
                      gradient: LinearGradient(colors: [
                        items[index].startkleur,
                        items[index].eindkleur
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      boxShadow: [
                        BoxShadow(
                          color: items[index].eindkleur,
                          blurRadius: 12,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    top: 0,
                    child: CustomPaint(
                      size: Size(100, 150),
                      painter: CustomCardShapePainter(_borderRadius,
                          items[index].startkleur, items[index].eindkleur),
                    ),
                  ),
                  Positioned.fill(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.assignment,
                          color: Colors.black,
                          size: 45.0,
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                items[index].title,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                items[index].subtitle,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                  size: 30.0,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            VragenlijstDemo()),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ignore: camel_case_types
// ignore: unused_element
class _OpenSettings {}

class PlaceInfo {
  final String title;
  final String subtitle;
  final Color startkleur;
  final Color eindkleur;

  PlaceInfo(this.title, this.startkleur, this.eindkleur, this.subtitle);
}

class CustomCardShapePainter extends CustomPainter {
  final double radius;
  final Color startkleur;
  final Color eindkleur;

  CustomCardShapePainter(this.radius, this.startkleur, this.eindkleur);

  @override
  void paint(Canvas canvas, Size size) {
    var radius = 24.0;

    var paint = Paint();
    paint.shader = ui.Gradient.linear(
        Offset(25, 0), Offset(size.width, size.height), [
      HSLColor.fromColor(startkleur).withLightness(0.8).toColor(),
      eindkleur
    ]);

    var path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(
          size.width, size.height, size.width, size.height - radius)
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(size.width - 1.5 * radius, 0)
      ..quadraticBezierTo(-radius, 2 * radius, 0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

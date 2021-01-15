//De gegevens zijn nu handmatig ingevuld voor een demo grafiek
//Het is de bedoeling dat de "coördinaten" automatische geladen worden.
//Er zou 1 lijn moeten zijn van de bijbehorende klacht waar op gedrukt is in het vorige menu.
//Er moet een optie komen dat er een lijn toegevoegd kan worden.
//Er mist nog een legenda.

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authenticatie/screens/Klachtenscherm/klachtenScreen.dart';
import 'package:flutter_authenticatie/screens/chat_en_Forum/Forum/Forum.dart';
import 'package:flutter_authenticatie/screens/profiel/Profiel.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_authenticatie/screens/grafieken/grafieken_homescreen.dart';
import '../../constants.dart';
import '../../main.dart';

class Grafiek extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LineChartSample1State();
}

class LineChartSample1State extends State<Grafiek> {
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
              onPressed: () {}, // moet nog geluid worden toegevoegd
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
          height: 320,
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(18)),
            gradient: LinearGradient(
              colors: const [
                Color(0xffbfd9cf), //Paris white achtergrondkleur onder
                Color(0xff46426c), //Paarse achtergrondkleur boven
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Klachteninvoer per dag (demo)',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0, left: 6.0),
                  child: LineChart(sampleData1()),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
  }

  LineChartData sampleData1() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.white,
        ),
        touchCallback: (LineTouchResponse touchResponse) {},
        handleBuiltInTouches: true,
      ),
      gridData: FlGridData(
        show: true,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          margin: 10,
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'Ma';
              case 3:
                return 'Di';
              case 5:
                return 'Woe';
              case 7:
                return 'Do';
              case 9:
                return 'Vrij';
              case 11:
                return 'Za';
              case 13:
                return 'Zo';
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '2';
              case 2:
                return '4';
              case 3:
                return '6';
              case 4:
                return '8';
              case 5:
                return '10';
            }
            return '';
          },
          margin: 8,
          reservedSize: 30,
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(
            color: Colors.white,
            width: 4,
          ),
          left: BorderSide(
            color: Colors.white,
            width: 4,
          ),
          right: BorderSide(
            color: Colors.transparent,
          ),
          top: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      minX: 0,
      maxX: 14,
      maxY: 5,
      minY: 0,
      lineBarsData: linesBarData1(),
    );
  }

  List<LineChartBarData> linesBarData1() {
    final LineChartBarData lineChartBarDataGeheugenverlies = LineChartBarData(
      spots: [
        FlSpot(1, 2.8),
        FlSpot(3, 1.9),
        FlSpot(5, 3),
        FlSpot(7, 1.3),
        FlSpot(9, 2.5),
        FlSpot(11, 2.3),
        FlSpot(13, 2.1),
      ],
      isCurved: true,
      colors: const [
        Color(0xffc4bffd), //lichtpaars
      ],
      barWidth: 8,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );

    final LineChartBarData lineChartBarDataOpgezetteBenen = LineChartBarData(
      spots: [
        FlSpot(1, 1.6),
        FlSpot(3, 2.3),
        FlSpot(5, 3.4),
        FlSpot(7, 3.6),
        FlSpot(9, 0),
        FlSpot(11, 0.7),
        FlSpot(13, 1.0),
      ],
      isCurved: true,
      colors: [
        const Color(0Xff46fb8), //Wisteriapaars
      ],
      barWidth: 8,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );

    final LineChartBarData lineChartBarDataConcentratieprobleem =
        LineChartBarData(
      spots: [
        FlSpot(1, 1),
        FlSpot(3, 1.5),
        FlSpot(5, 1.4),
        FlSpot(7, 3.4),
        FlSpot(9, 2),
        FlSpot(11, 2.2),
        FlSpot(13, 1.0),
      ],
      isCurved: true,
      colors: [
        const Color(0XFF72E389), //groene lijn
      ],
      barWidth: 8,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );

    final LineChartBarData lineChartBarDataSomberheid = LineChartBarData(
      spots: [
        FlSpot(1, 1),
        FlSpot(3, 2.8),
        FlSpot(5, 1.2),
        FlSpot(7, 2.8),
        FlSpot(9, 2.6),
        FlSpot(11, 3.0),
        FlSpot(13, 0),
      ],
      isCurved: true,
      colors: [
        kPrimaryLightColor,
      ],
      barWidth: 8,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
        colors: [
          kPrimaryLightColor.withOpacity(0.3),
        ],
      ),
    );

    return [
      lineChartBarDataOpgezetteBenen,
      lineChartBarDataGeheugenverlies,
      lineChartBarDataConcentratieprobleem,
      lineChartBarDataSomberheid,
    ];
  }
}

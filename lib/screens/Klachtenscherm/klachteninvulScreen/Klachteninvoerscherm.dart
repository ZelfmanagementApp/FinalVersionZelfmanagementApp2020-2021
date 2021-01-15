//De input hiervan moet nog gekoppeld worden met een database.
//Deze gegevens zouden vervolgens in een listview moeten komen en in de grafieken.
//afbeelding waarop de pijn moet worden aangegeven werkt ook niet.
//Opmaak kan misschien nog iets netter

import 'package:flutter/material.dart';
import 'package:flutter_authenticatie/screens/homeScreen/home_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants.dart';
import 'scorebalk.dart';

class Welzijn extends StatefulWidget {
  @override
  _WelzijnState createState() => _WelzijnState();
}

class _WelzijnState extends State<Welzijn> {
  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

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
            onPressed: () {}, // Nog geen geluid
          ),
        ],
      ),
      body: Column(
        children: [
          Text("Gezondheidsregistratie",
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600))),
          SizedBox(
            height: 2.0,
          ),
          Text(
              "Klopt de datum van de klacht? zo niet verander deze door op de knop te drukken",
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600))),
          SizedBox(
            height: 3.0,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "${selectedDate.toLocal()}".split(' ')[0],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5.0,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(29.0))),
                onPressed: () => _selectDate(context), // Refer step 3
                child: Text(
                  'Kies een andere datum',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                color: kPrimaryLightColor,
              ),
            ],
          ),
          SizedBox(
            height: 5.0,
          ),
          Text("Vul hieronder een omschrijving van de klacht in:",
              textAlign: TextAlign.left,
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600))),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: new InputDecoration(
                enabledBorder: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.black)),
                labelText: 'Type hier',
              ),
            ),
          ),
          Text("Klik hieronder om visueel een specifieke locatie op te geven:",
              textAlign: TextAlign.left,
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600))),
          RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(29.0))),
            color: kPrimaryLightColor,
            child: Text("Locatie kiezen",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => _buildPopupDialog(context),
              );
            },
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
              "Geef hieronder de score van de klacht aan door met het bolletje heen en weer te bewegen:\n",
              textAlign: TextAlign.left,
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600))),
          Text("Hoeveel last ervaart u in uw dagelijkse handelen\n",
              textAlign: TextAlign.left,
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600))),
          Center(
            child: SliderWidget(),
          ),
          SizedBox(
            height: 5.0,
          ),
          RaisedButton(
            color: kPrimaryLightColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(29.0))),
            child: Text("Ga verder"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SliderWidget extends StatefulWidget {
  final double sliderHeight;
  final int min;
  final int max;
  final fullWidth;

  SliderWidget(
      {this.sliderHeight = 48,
      this.max = 10,
      this.min = 0,
      this.fullWidth = false});

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double _value = 0;

  @override
  Widget build(BuildContext context) {
    double paddingFactor = .2;

    if (this.widget.fullWidth) paddingFactor = .3;

    return Container(
      width: this.widget.fullWidth
          ? double.infinity
          : (this.widget.sliderHeight) * 5.5,
      height: (this.widget.sliderHeight),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.all(
          Radius.circular((this.widget.sliderHeight * .3)),
        ),
        gradient: new LinearGradient(
            colors: [
              const Color(0xFF4CAF50),
              const Color(0xFFD50000),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 1.00),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(this.widget.sliderHeight * paddingFactor,
            2, this.widget.sliderHeight * paddingFactor, 2),
        child: Row(
          children: <Widget>[
            Text(
              '${this.widget.min}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: this.widget.sliderHeight * .3,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: this.widget.sliderHeight * .1,
            ),
            Expanded(
              child: Center(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white.withOpacity(1),
                    inactiveTrackColor: Colors.white.withOpacity(.5),

                    trackHeight: 4.0,
                    thumbShape: CustomSliderThumbCircle(
                      thumbRadius: this.widget.sliderHeight * .4,
                      min: this.widget.min,
                      max: this.widget.max,
                    ),
                    // overlayColor: Colors.white.withOpacity(.4),
                    //valueIndicatorColor: Colors.white,
                    activeTickMarkColor: Colors.white,
                    inactiveTickMarkColor: Colors.red.withOpacity(.7),
                  ),
                  child: Slider(
                      value: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      }),
                ),
              ),
            ),
            SizedBox(
              width: this.widget.sliderHeight * .1,
            ),
            Text(
              '${this.widget.max}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: this.widget.sliderHeight * .3,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildPopupDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text(
        'Druk hieronder op de afbeelding'), //Dit werkt nog helemaal niet, voorbeeld afb
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset('assets/images/humanbody.jpg', width: 250, height: 250),
      ], //https://www.freepik.com/free-photo/human-body-muscles-woman_1036785.htm#page=2&query=anatomy&position=27' People photo created by kjpargeter - www.freepik.com</a>
    ),
    actions: <Widget>[
      new FlatButton(
        color: kPrimaryColor,
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Colors.white,
        child: const Text('sluiten'),
      ),
    ],
  );
}

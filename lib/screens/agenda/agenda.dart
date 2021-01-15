//Moet nog verbonden worden met een database en er moet nog een tijdsaspect bij.
//QR Scanner is weggehaald, nadat gezegd werd dat dit waarschijnlijk niet te realiseren viel.
//Let op de maanden etc. staan nog in het engels.

import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_authenticatie/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:flutter_authenticatie/screens/agenda/theme_agenda.dart';
import 'package:flutter_authenticatie/screens/agenda/db.dart';
import 'package:flutter_authenticatie/screens/agenda/agenda_model.dart';

class Agenda extends StatefulWidget {
  @override
  _AgendaState createState() => _AgendaState();
}

class _AgendaState extends State<Agenda> {
  DateTime _selectedDay = DateTime.now();

  CalendarController _calendarController;
  Map<DateTime, List<dynamic>> _events = {};
  List<AgendaItem> _data = [];

  List<dynamic> _selectedEvents = [];
  List<Widget> get _eventWidgets =>
      _selectedEvents.map((e) => events(e)).toList();

  void initState() {
    super.initState();
    DB.init().then((value) => _fetchEvents());
    _calendarController = CalendarController();
  }

  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  Widget events(var d) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
          decoration: BoxDecoration(
              border: Border(
            top: BorderSide(color: Theme.of(context).dividerColor),
          )),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(d, style: Theme.of(context).primaryTextTheme.bodyText1),
            IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.trashAlt,
                  color: kPrimaryLightColor,
                  size: 15,
                ),
                onPressed: () => _deleteEvent(d))
          ])),
    );
  }

  // ignore: unused_element
  void _onDaySelected(DateTime day, List events) {
    setState(() {
      _selectedDay = day;
      _selectedEvents = events;
    });
  }

  void _create(BuildContext context) {
    String _name = "";
    var content = TextField(
      style: GoogleFonts.montserrat(
        textStyle: TextStyle(
            color: Colors.blue[900], fontSize: 22, fontWeight: FontWeight.bold),
      ),
      autofocus: true,
      decoration: InputDecoration(
        labelStyle: GoogleFonts.montserrat(
          textStyle: TextStyle(
              color: Colors.blue[900],
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
        labelText: 'Voer in',
      ),
      onChanged: (value) {
        _name = value;
      },
    );
    var btn = FlatButton(
      child: Text(
        'Opslaan',
        style: GoogleFonts.montserrat(
            textStyle: TextStyle(
                color: kPrimaryColor,
                fontSize: 22,
                fontWeight: FontWeight.bold)),
      ),
      onPressed: () => _addEvent(_name),
    );
    var cancelButton = FlatButton(
        child: Text(
          'Stop',
          style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
        ),
        onPressed: () => Navigator.of(context).pop(false));
    showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: const Offset(0.0, 10.0),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // To make the card compact
                children: <Widget>[
                  SizedBox(height: 16.0),
                  Text(
                    "Voeg een afspraak of activiteit toe",
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Colors.blue[900],
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                  ),
                  Container(padding: EdgeInsets.all(20), child: content),
                  Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[btn, cancelButton]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _fetchEvents() async {
    _events = {};
    List<Map<String, dynamic>> _results = await DB.query(AgendaItem.table);
    _data = _results.map((item) => AgendaItem.fromMap(item)).toList();
    _data.forEach((element) {
      DateTime formattedDate = DateTime.parse(DateFormat('yyyy-MM-dd')
          .format(DateTime.parse(element.date.toString())));
      if (_events.containsKey(formattedDate)) {
        _events[formattedDate].add(element.name.toString());
      } else {
        _events[formattedDate] = [element.name.toString()];
      }
    });
    setState(() {});
  }

  void _addEvent(String event) async {
    AgendaItem item = AgendaItem(date: _selectedDay.toString(), name: event);
    await DB.insert(AgendaItem.table, item);
    _selectedEvents.add(event);
    _fetchEvents();

    Navigator.pop(context);
  }

  // Delete doesnt refresh yet, thats it, then done!
  void _deleteEvent(String s) {
    List<AgendaItem> d = _data.where((element) => element.name == s).toList();
    if (d.length == 1) {
      DB.delete(AgendaItem.table, d[0]);
      _selectedEvents.removeWhere((e) => e == s);
      _fetchEvents();
    }
  }

  Widget calendar() {
    return Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            gradient: LinearGradient(
                colors: [kPrimaryLightColor, kPrimaryLightColor]),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: new Offset(0.0, 5))
            ]),
        child: TableCalendar(
          calendarStyle: CalendarStyle(
            canEventMarkersOverflow: true,
            markersColor: Colors.white,
            weekdayStyle: TextStyle(color: Colors.white),
            todayColor: Colors.white,
            todayStyle: TextStyle(
                color: kPrimaryColor,
                fontSize: 15,
                fontWeight: FontWeight.bold),
            selectedColor: kPrimaryColor,
            outsideWeekendStyle: TextStyle(color: Colors.white60),
            outsideStyle: TextStyle(color: Colors.white60),
            weekendStyle: TextStyle(color: Colors.white),
            renderDaysOfWeek: false,
          ),
          onDaySelected: (date, events, _) {
            print(date.toIso8601String());
          },
          calendarController: _calendarController,
          events: _events,
          headerStyle: HeaderStyle(
            leftChevronIcon:
                Icon(Icons.arrow_back_ios, size: 15, color: Colors.white),
            rightChevronIcon:
                Icon(Icons.arrow_forward_ios, size: 15, color: Colors.white),
            titleTextStyle: GoogleFonts.montserrat(
              textStyle: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            formatButtonDecoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.circular(20),
            ),
            formatButtonTextStyle: GoogleFonts.montserrat(
              textStyle: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }

  Widget eventTitle() {
    if (_selectedEvents.length == 0) {
      return Container(
        padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
        child: Text("Geen gebeurtenissen",
            style: Theme.of(context).primaryTextTheme.headline1),
      );
    }
    return Container(
      padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
      child: Text("gebeurtenis",
          style: Theme.of(context).primaryTextTheme.headline1),
    );
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
            onPressed: () {}, // omitting onPressed makes the button disabled
          ),
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Agenda",
                    style: Theme.of(context).primaryTextTheme.headline1),
                Consumer<ThemeNotifier>(
                    builder: (context, notifier, child) => IconButton(
                        icon: notifier.isDarkTheme
                            ? FaIcon(
                                FontAwesomeIcons.moon,
                                size: 20,
                                color: Colors.white,
                              )
                            : Icon(Icons.wb_sunny),
                        onPressed: () => {notifier.toggleTheme()}))
              ],
            ),
          ),
          calendar(),
          eventTitle(),
          Column(children: _eventWidgets),
          SizedBox(height: 60)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () => _create(context),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

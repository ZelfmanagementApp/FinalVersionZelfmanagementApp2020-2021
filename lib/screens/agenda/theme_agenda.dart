//Kleuren van het agenda en de optie om het contrast aan te passen

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData light = ThemeData(
  primaryColor: Color.fromRGBO(246, 248, 250, 1.0),
  accentColor: Color.fromRGBO(50, 50, 50, 1),
  primaryTextTheme: TextTheme(
    // Section Headings
    headline1: GoogleFonts.montserrat(
      textStyle: TextStyle(
          color: Colors.blue[900], fontSize: 22, fontWeight: FontWeight.bold),
    ),
    // List Font
    bodyText1: GoogleFonts.montserrat(
      textStyle: TextStyle(
          color: Colors.blue[900], fontSize: 22, fontWeight: FontWeight.bold),
    ),
  ),
);

ThemeData dark = ThemeData(
    primaryColor: Color.fromRGBO(31, 31, 31, 1.0),
    accentColor: Color.fromRGBO(200, 200, 200, 1),
    dividerColor: Color.fromRGBO(200, 200, 200, 0.1),
    primaryTextTheme: TextTheme(
      // Section Headings
      headline1: GoogleFonts.montserrat(
        textStyle: TextStyle(
            color: Colors.blue[900], fontSize: 22, fontWeight: FontWeight.bold),
      ),
      // List Font
      bodyText1: GoogleFonts.montserrat(
        textStyle: TextStyle(
            color: Colors.blue[900], fontSize: 22, fontWeight: FontWeight.bold),
      ),
    ));

class ThemeNotifier extends ChangeNotifier {
  final String key = "theme";
  SharedPreferences _prefs;
  bool _isDarkTheme;

  bool get isDarkTheme => _isDarkTheme;

  ThemeNotifier() {
    _isDarkTheme = false;
    _getThemPref();
  }

  // Wissel van thema
  toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    _setThemePrefs();
    notifyListeners();
  }

  // Sla thema voorkeur op
  _getThemPref() async {
    await _initPrefs();
    _isDarkTheme = _prefs.getBool(key) ?? false;
    notifyListeners();
  }

  // kies voorkeursthema
  _setThemePrefs() async {
    await _initPrefs();
    _prefs.setBool(key, _isDarkTheme);
  }

  // Initiate a preference
  _initPrefs() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
  }
}

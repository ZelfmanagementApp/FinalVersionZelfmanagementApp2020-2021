//Vanuit hier wordt de app gerund.

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/wrapper.dart';
import 'services/authentication.dart';
import 'screens/agenda/theme_agenda.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
          builder: (context, ThemeNotifier notifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: notifier.isDarkTheme ? dark : light,
          home: Home(),
        );
      }),
    );
  }
}

class Home extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text('Foutmelding'),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              body: Center(
                child: Wrapper(
                  auth: Auth(),
                ),
              ),
            );
          }
          return Scaffold(
              body: Center(
            child: Text('Laden'),
          ));
        },
      ),
    );
  }
}

//Inlogscherm in principe verbonden met Firebase.
//Er moet waarschijnlijk nog om een naam worden gevraagd bij het aanmaken van het account, aangezien dit toch wel handig is voor de rest v.d. code.
//Afbeelding wil niet helemaal fullscreen, maar zodra dit wel lukt schiet er weer teveel uit aan de bodem
//Ook moet de wachtwoord vergeten optie nog worden toegevoegd.
//Talen optie moet nog worden toegevoegd. Hier moet de eerste splitsing plaatsvinden.

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authenticatie/services/authentication.dart';
import '../../constants.dart';

class LoginSignUpPage extends StatefulWidget {
  LoginSignUpPage({this.auth, this.onSignedIn});

  final BaseAuth auth;
  final VoidCallback onSignedIn;

  @override
  _LoginSignUpPageState createState() => _LoginSignUpPageState();
}

enum FormMode { LOGIN, SIGNUP }

class _LoginSignUpPageState extends State<LoginSignUpPage> {
  final _formKey = GlobalKey<FormState>();

  String _email;
  String _password;

  FormMode _formMode = FormMode.LOGIN;

  bool _validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void _validateAndSubmit() async {
    if (_validateAndSave()) {
      String userId = "";
      if (_formMode == FormMode.LOGIN) {
        // de gebruiker logt in
        try {
          UserCredential userCredential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: _email, password: _password);
          userId = userCredential.user.uid;
        } on FirebaseAuthException catch (e) {
          if (e.code == 'gebruiker-niet-gevonden') {
            _showErrorOrSuccessDialog(
                'Niet gevonden',
                _email +
                    ' Kan niet worden gevonden! Moet U een account aanmaken?');
            print('Geen account gevonden bij die email.');
          } else if (e.code == 'Verkeerd wachtwoord') {
            _showErrorOrSuccessDialog(
                'Foutmelding!',
                'Het wachtwoord dat U heeft ingevuld voor ' +
                    _email +
                    ' is onjuist.');
            print('Verkeerde wachtwoord is ingevuld bij die gebruiker.');
          }
        } catch (e) {
          _showErrorOrSuccessDialog('Foutmelding!', e);
          print(e);
        }
      } else {
        // Maak een nieuwe gebruiker
        try {
          UserCredential userCredential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: _email, password: _password);
          _showErrorOrSuccessDialog('Gelukt!',
              'Log alstublieft in met de gebruikersnaam en het gemaakte wachtwoord!');
          userId = userCredential.user.uid;
        } on FirebaseAuthException catch (e) {
          if (e.code == 'zwak wachtwoord') {
            _showErrorOrSuccessDialog('Zwak wachtwoord!',
                'Gebruik alstublieft een sterker wachtwoord.');
            print('Het wachtwoord is te zwak.');
          } else if (e.code == 'email is al in gebruik') {
            _showErrorOrSuccessDialog(
                'Foutmelding!', 'Deze email wordt al in gebruik genomen.');
            print('Er bestaat al een account bij die email.');
          }
        } catch (e) {
          _showErrorOrSuccessDialog('Foutmelding!', e);
          print(e);
        }
      }
      if (userId.length > 0 && userId != null && _formMode == FormMode.LOGIN) {
        widget.onSignedIn();
      }
    }
  }

  void _showErrorOrSuccessDialog(String messageTitle, String messageText) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text(messageTitle),
          content: Text(messageText),
          actions: <Widget>[
            FlatButton(
              child: Text("Negeer"),
              onPressed: () {
                if (messageTitle == "Success!") {
                  _changeFormToLogin();
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _changeFormToSignUp() {
    _formKey.currentState.reset();
    setState(() {
      _formMode = FormMode.SIGNUP;
    });
  }

  void _changeFormToLogin() {
    _formKey.currentState.reset();
    setState(() {
      _formMode = FormMode.LOGIN;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Image.asset("assets/images/logo.jpg"),
          centerTitle: true,
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/erasmus1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 10),
                  RichText(
                      text: TextSpan(
                    text: 'Welkom bij de EMC zelfmanagement app!',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
                  SizedBox(height: size.height * 0.05),
                  Image.asset(
                    "assets/images/hal.jpg",
                    height: size.height * 0.30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          _buildEmailInput(),
                          _buildPasswordInput(),
                          _buildLoginOrCreateBtn(),
                          _buildSwitchFromLoginToCreateBtn(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }

  Widget _buildEmailInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextFormField(
        cursorColor: kPrimaryColor,
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'Email',
          hintStyle: TextStyle(color: kPrimaryColor),
          icon: Icon(
            Icons.mail,
            color: kPrimaryColor,
          ),
        ),
        validator: (value) =>
            value.isEmpty ? 'Email kan niet leeg worden gelaten' : null,
        onSaved: (value) => _email = value.trim(),
      ),
    );
  }

  Widget _buildPasswordInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextFormField(
        cursorColor: kPrimaryColor,
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'Wachtwoord',
          hintStyle: TextStyle(color: kPrimaryColor),
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
        ),
        validator: (value) =>
            value.isEmpty ? 'wachtwoord kan niet leeg worden gelaten' : null,
        onSaved: (value) => _password = value.trim(),
      ),
    );
  }

  Widget _buildLoginOrCreateBtn() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15.0, 0, 0),
      child: SizedBox(
        height: 40.0,
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              30.0,
            ),
          ),
          color: kPrimaryColor,
          child: _formMode == FormMode.LOGIN
              ? Text(
                  'Inloggen',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )
              : Text(
                  'Maak een account aan',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
          onPressed: _validateAndSubmit,
        ),
      ),
    );
  }

  Widget _buildSwitchFromLoginToCreateBtn() {
    return FlatButton(
        //minWidth: MediaQuery.of(context).size.width,
        onPressed: _formMode == FormMode.LOGIN
            ? _changeFormToSignUp
            : _changeFormToLogin,
        child: _formMode == FormMode.LOGIN
            ? Text('Heeft U nog geen account? Klik hier!',
                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold))
            : Text('Heeft U al een account? Login.',
                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold)));
  }
}

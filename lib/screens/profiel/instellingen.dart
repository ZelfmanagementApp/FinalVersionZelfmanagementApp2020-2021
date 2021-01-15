// Er zal in een later stadium nog een kritisch gekeken moeten worden naar de verschillende onderdelen.
//Ook zullen de optie nog werkend gemaakt moeten worden, nu staan er vooral de UI nagemaakt.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authenticatie/constants.dart';
import 'package:flutter_svg/svg.dart';

class Instellingen extends StatefulWidget {
  @override
  _InstellingenState createState() => _InstellingenState();
}

class _InstellingenState extends State<Instellingen> {
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
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/erasmus1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            padding: EdgeInsets.only(left: 16, top: 25, right: 16),
            child: ListView(
              children: [
                Text(
                  "Instellingen",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: kPrimaryColor,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Accountinstellingen",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Divider(
                  height: 15,
                  thickness: 2,
                ),
                buildAccountOptionRowWachtwoord(context, "Wachtwoord"),
                buildAccountOptionRowGebruikersnaam(context, "Gebruikersnaam"),
                buildAccountOptionRowTaal(context, "Taal"),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.account_box,
                      color: kPrimaryColor,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Zichtbaarheid & Privacy",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Divider(
                  height: 15,
                  thickness: 2,
                ),
                SizedBox(
                  height: 8,
                ),
                buildAccountOptionRowPersoonlijkeGegevens(
                    context, "Persoonlijke gegevens"),
                buildAccountOptionRowProfielfotoWijzigigen(
                    context, "Profielfoto wijzigen"),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.volume_up,
                      color: kPrimaryColor,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Meldingen",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Divider(
                  height: 15,
                  thickness: 2,
                ),
                SizedBox(
                  height: 8,
                ),
                buildNotificationOptionRow("Pushnotificaties", true),
                buildNotificationOptionRow("Geluid", true),
                SizedBox(
                  height: 8,
                ),
                Center(
                  child: OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {},
                    child: Text("Afmelden",
                        style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 2.2,
                            color: kPrimaryColor)),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: kPrimaryColor),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              onChanged: (bool val) {},
            ))
      ],
    );
  }

  GestureDetector buildAccountOptionRowWachtwoord(
      BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Huidige wachtwoord"),
                    Text("Nieuw wachtwoord"),
                    Text("Herhaal wachtwoord"),
                  ],
                ),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Sluiten")),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: kPrimaryColor,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}

GestureDetector buildAccountOptionRowGebruikersnaam(
    BuildContext context, String title) {
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Huidige gebruikersnaam",
                  ),
                  Text("Nieuwe gebruikersnaam"),
                ],
              ),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Sluiten")),
              ],
            );
          });
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: kPrimaryColor,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: kPrimaryColor,
          ),
        ],
      ),
    ),
  );
}

GestureDetector buildAccountOptionRowTaal(BuildContext context, String title) {
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("English"),
                  Text("Ploski"),
                  Text("Deutsch"),
                  Text("Türk"),
                ],
              ),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Sluiten")),
              ],
            );
          });
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: kPrimaryColor,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: kPrimaryColor,
          ),
        ],
      ),
    ),
  );
}

GestureDetector buildAccountOptionRowPersoonlijkeGegevens(
    BuildContext context, String title) {
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Naam"),
                  Text("Geboortedatum"),
                  Text("Ziektenbeeld"),
                ],
              ),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Sluiten")),
              ],
            );
          });
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: kPrimaryColor,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: kPrimaryColor,
          ),
        ],
      ),
    ),
  );
}

GestureDetector buildAccountOptionRowProfielfotoWijzigigen(
    BuildContext context, String title) {
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Optie moet worden toegevoegd"),
                ],
              ),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Sluiten")),
              ],
            );
          });
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: kPrimaryColor,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: kPrimaryColor,
          ),
        ],
      ),
    ),
  );
}

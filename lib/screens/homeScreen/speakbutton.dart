//Voorbeeld van een werkende Audioafspeelknop
//Niet in de app geïmplementeerd

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

final assetsAudioPlayer = AssetsAudioPlayer();

class Voorleesknop extends StatefulWidget {
  @override
  _VoorleesknopState createState() => _VoorleesknopState();
}

class _VoorleesknopState extends State<Voorleesknop> {
  bool _play = false;

  @override
  Widget build(BuildContext context) {
    return AudioWidget.assets(
      path: "assets/audio/homescreen.mp3",
      play: _play,
      child: RaisedButton(
          child: Text(
            _play ? "pause" : "play",
          ),
          onPressed: () {
            setState(() {
              _play = !_play;
            });
          }),
      onReadyToPlay: (duration) {
        //onReadyToPlay
      },
      onPositionChanged: (current, duration) {
        //onPositionChanged
      },
    );
  }
}

//Opmaak voor demo Forum versie

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'post.dart';
import 'postList.dart';
import 'Forum_textfield.dart';
import '../../../constants.dart';

class Forum extends StatefulWidget {
  @override
  _ForumState createState() => _ForumState();
}

class _ForumState extends State<Forum> {
   List<Post> posts = [];

 void newPost(String text) {
    this.setState(() {
      posts.add(new Post(text, "anoniem")); //dit moet uiteraard de naam van de user worden.
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
            onPressed: () {}, // geluid moet nog worden toegevoegd
          ),
        ],
      ),
      //Haal de onderdelen binnen
      body: Column(children: <Widget>[
          Expanded(child: PostList(this.posts)),
          TextInputWidget(this.newPost)
        ]));
  }
}

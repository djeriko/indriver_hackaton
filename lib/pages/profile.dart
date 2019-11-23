import 'package:flutter/material.dart';
import 'package:in_flutter/components/my_app_bar.dart';
import 'package:in_flutter/components/my_bottom_nav_bar.dart';

class Profile extends StatefulWidget {
  var urlImage;

  Profile({Key key, this.urlImage}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        titleText: "Профиль",
        showBack: true,
      ),
      body:

          // Text style
          DefaultTextStyle(
        style: TextStyle(
            fontFamily: "Montserrat", color: Colors.black, fontSize: 15),
        textAlign: TextAlign.start,
        child: Container(
          child: Column(
            children: <Widget>[
              // Column start
              Image.network(widget.urlImage),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: Row(
                  children: <Widget>[
                    // Age
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Возраст:",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                    ),

                    // Age number
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("23"),
                      ),
                    ),
                  ],
                ),
              ),
              
              // About
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "О себе",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
              ),

              // About text
              Text(
                  "Учусь на юриста в СБУ, люблю рисовать и проводить время за просмотром фильмов"),
              Text("Хобби"),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomAppBar(),
    );
  }
}

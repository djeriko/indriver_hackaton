import 'package:flutter/material.dart';
import 'package:in_flutter/components/my_app_bar.dart';
import 'package:in_flutter/components/my_bottom_nav_bar.dart';
import 'package:async/async.dart';

class Profile extends StatefulWidget {
  var urlImage;

  Profile({Key key, this.urlImage}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile>  {

  @override
  Widget build(BuildContext context)  {
    return   Scaffold(
      appBar: MyAppBar(
        titleText: widget.urlImage.userName,
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
              Image.network(widget.urlImage.urlToImage),
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
                        child: Text(widget.urlImage.userAge),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 6, 0, 0),
                child: Text(
                    widget.urlImage.userAbout, textAlign: TextAlign.left,),
              ),

              // Hobbies
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 12, 0, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Хобби", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),)),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomAppBar(),
    );
  }
}

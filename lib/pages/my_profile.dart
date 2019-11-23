import 'package:flutter/material.dart';
import 'package:in_flutter/components/my_app_bar.dart';
import 'package:in_flutter/components/my_bottom_nav_bar.dart';
import 'package:in_flutter/models/my_profile.dart';
import 'package:in_flutter/services/webservice.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  List<MyProfileData> _myProfileData = List<MyProfileData>();

  @override
  void initState() {
    super.initState();
    _populateMyProfileData();
  }

  void _populateMyProfileData() {
    Webservice().load(MyProfileData.all).then((myProfileData) => {
          setState(() => {_myProfileData = myProfileData})
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        titleText: "Мой профиль",
        showBack: true,
        showEdit: true,
        showSearch: false,
      ),
      body: Container(
        child:

            // Text style
            DefaultTextStyle(
          style: TextStyle(
              fontFamily: "Montserrat", color: Colors.black, fontSize: 15),
          textAlign: TextAlign.start,
          child: Container(
            child: Column(
              children: <Widget>[
                // Column start
                Image.network(_myProfileData[0].urlToImage),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FlatButton(
                      child: Text(
                        'Информация',
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () {},
                    ),
                    Container(width: 1, height: 20, color: Colors.black38),
                    FlatButton(
                      child: Text('История'),
                      onPressed: () {},
                      textColor: Colors.black38,
                      disabledTextColor: Colors.yellow,
                    )
                  ],
                ),
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
                          child: Text(_myProfileData[0].userAge),
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
                        textAlign: TextAlign.left,
                      )),
                ),

                // About text
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 6, 0, 0),
                  child: Text(
                    _myProfileData[0].userAbout,
                    textAlign: TextAlign.left,
                  ),
                ),

                // Hobbies
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 12, 0, 0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Хобби",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: MyBottomAppBar(),
    );
  }
}

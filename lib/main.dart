import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_flutter/components/main_list_view.dart';
import 'package:in_flutter/components/my_app_bar.dart';
import 'package:in_flutter/models/offer_article.dart';
import 'package:in_flutter/pages/request_slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Friend for an hour',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExampleHomePage(),
    );
  }
}

class ExampleHomePage extends StatefulWidget {
  @override
  _ExampleHomePageState createState() => _ExampleHomePageState();
}

class _ExampleHomePageState extends State<ExampleHomePage>
    with TickerProviderStateMixin {
  var alertSize = 0.0;
  var showAlert = true;
  var myTitle = "qwe";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // TopAppBar
      appBar: MyAppBar(titleText: "Главная", showBack: false,),

      //Body
      body: MainListView(),

      //BottomNavBar
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        color: Colors.white,
        elevation: 0.2,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
              color: Colors.black,
            ),
            IconButton(
              icon: Icon(Icons.add_circle_outline),
              onPressed: () {},
              color: Colors.black,
            ),
            IconButton(
              icon: Icon(Icons.history),
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => new RequestSlider()));
              },
              color: Colors.black,
            ),
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {},
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

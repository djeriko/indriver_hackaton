import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:in_flutter/components/main_list_view.dart';
import 'package:in_flutter/components/my_app_bar.dart';
import 'package:in_flutter/components/my_bottom_nav_bar.dart';


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
      resizeToAvoidBottomPadding: false,

      // TopAppBar
      appBar: MyAppBar(titleText: "Главная", showBack: false, showEdit: false, showSearch: true,),

      //Body

      body: MainListView(),


      //BottomNavBar
      bottomNavigationBar: MyBottomAppBar() 
    );
  }
}

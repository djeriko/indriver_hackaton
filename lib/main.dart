import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

import 'package:in_flutter/components/main_list_view.dart';
import 'package:in_flutter/components/my_app_bar.dart';
import 'package:in_flutter/components/my_bottom_nav_bar.dart';

import 'package:in_flutter/components/main_list_view.dart' as first;
import 'package:in_flutter/pages/add_offer.dart' as second;
import 'package:in_flutter/pages/edit_profile.dart';
import 'package:in_flutter/pages/request_slider.dart' as third;
import 'package:in_flutter/pages/my_profile.dart' as four;

import 'pages/my_messages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Friend for an hour',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyTabs(),
      //home: ExampleHomePage(),
    );
  }
}

///// TABS NAVIGATION
///
class MyTabs extends StatefulWidget{
  @override
  MyTabsState createState() => new MyTabsState();
}

class MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin{
  
  final List<MyTabsNav> _tabs = [new MyTabsNav(title: "Главная"), new MyTabsNav(title: "Добавить услугу"), new MyTabsNav(title: 'Запросы'), new MyTabsNav(title: 'Профиль')];

  TabController controller;
  MyTabsNav _myHandler;
  @override
  void initState(){
    super.initState();
    _myHandler = _tabs[0];
    controller = new TabController(vsync: this, length: 4);
    controller.addListener(_handleSelect);
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  void _handleSelect(){
    setState(() {
      _myHandler=_tabs[controller.index];
    });
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.add, color: Colors.red[900]),
            onPressed: () {},
          ),
          Text(
            _myHandler.title,
            style: TextStyle(color: Colors.black),
          ),
        ],
      ), 
      backgroundColor: Colors.white,
      actions: <Widget>[
        new IconButton(
          icon: Icon(Icons.search),
          color: Colors.black,
          onPressed: () {},
        ),
        new IconButton(
          icon: Icon(Icons.message, color: Colors.black),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> new MyMessages()));
          },
        ),
        new IconButton(
          icon: Icon(Icons.edit, color: Colors.black),
          onPressed: (){
            Navigator.push(context, CupertinoPageRoute(builder: (context)=> new EditProfile()));
          },
          color: Colors.black,
        ) 
      ],
      ),
      bottomNavigationBar: new Material(
        color: Colors.white,
        child: new TabBar(
          controller: controller,
          tabs: <Tab>[
            new Tab(icon: new Icon(Icons.home, color: Colors.black,)),
            new Tab(icon: new Icon(Icons.add_circle_outline, color: Colors.black,)),
            new Tab(icon: new Icon(Icons.history, color: Colors.black,)),
            new Tab(icon: new Icon(Icons.account_circle, color: Colors.black,))
          ]
        )
      ),
      body: new TabBarView(
        physics: prefix0.NeverScrollableScrollPhysics(),
        controller: controller,
        children: <Widget>[
          new first.MainListView(),
          new second.AddOffer(),
          new third.RequestSlider(),
          new four.MyProfile(),
        ]
      )
    );
  }
}

class MyTabsNav {
  final String title;
  MyTabsNav({this.title});
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:in_flutter/request_slider.dart';

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
  List<String> dogImages = new List();

  @override
  void initState() {
    super.initState();
    fetchFive();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // TopAppBar
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.add, color: Colors.red[900]),
              onPressed: () {},
            ),
            Text(
              "Друг на час",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        elevation: 3,
        backgroundColor: Colors.white,
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.search),
            color: Colors.black,
            onPressed: () {},
          ),
          new IconButton(
            icon: Icon(Icons.message, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),

      //Body
      body: ListView.builder(
        itemCount: dogImages.length,
        padding: const EdgeInsets.only(top: 10.0),
        itemBuilder: (BuildContext context, int index) {
          return Container(

              //Card height
              height: 477.0,

              //Card view
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                elevation: 5,
                margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    // Image part
                    Material(
                      elevation: 10,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Container(
                          constraints:
                              BoxConstraints.tightFor(height: 236, width: 390),
                          child: Image.network(dogImages[index],
                              fit: BoxFit.fitWidth),
                        ),
                      ),
                    ),

                    // Price and time part
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            //Price
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.attach_money,
                                  color: Colors.red[900],
                                ),
                                Container(
                                  width: 10,
                                ),
                                Column(
                                  children: <Widget>[
                                    Text("Цена",
                                        style:
                                            TextStyle(color: Colors.black38)),
                                    Divider(
                                      height: 4,
                                    ),
                                    Text("2 билетa")
                                  ],
                                )
                              ],
                            ),
                            //Divider
                            Container(
                              height: 40,
                              width: 1,
                              color: Colors.black38,
                            ),
                            //Time
                            Row(
                              children: <Widget>[
                                Icon(Icons.access_time, color: Colors.red[900]),
                                Container(
                                  width: 10,
                                ),
                                Column(
                                  children: <Widget>[
                                    Text("Время",
                                        style:
                                            TextStyle(color: Colors.black38)),
                                    Divider(
                                      height: 4,
                                    ),
                                    Text("18:30")
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    // Main info text
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        "Нужен друг для похода в кино",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700, fontFamily: 'Montserrat'),
                      ),
                    ),
                    // Description text
                    Padding(
                      padding: const EdgeInsets.fromLTRB(11.0, 10, 9.0, 1),
                      child: Text(
                        "Ищу друга на вечер, для похода в кино, денег не беру, есть два билета. парень или девушка, не важно.",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                            ), // doesnt work well
                      ),
                    ),
                    // Tags
                    // Button @TODO add gradient
                    ButtonTheme(
                      minWidth: 300.0,
                      height: 44,
                      child: RaisedButton(
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22.0)),
                        child: Text(
                          "Отправить предложение",
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Montserrat'),
                        ),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ));
        },
      ),

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

  fetch() async {
    final responce = await http.get('https://dog.ceo/api/breeds/image/random');
    if (responce.statusCode == 200) {
      setState(() {
        dogImages.add(json.decode(responce.body)['message']);
      });
    } else {
      throw Exception("Fail");
    }
  }

  fetchFive() {
    for (int i = 0; i < 10; i++) {
      fetch();
    }
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_flutter/components/loading.dart';
import 'package:in_flutter/models/offer_article.dart';
import 'package:in_flutter/pages/profile.dart';
import 'package:in_flutter/services/webservice.dart';
import 'dart:ui' as ui;

class MainListView extends StatefulWidget {
  @override
  _MainListViewState createState() => _MainListViewState();
}

class _MainListViewState extends State<MainListView> {
  List<OfferArticle> _offerArticles = List<OfferArticle>();

  var alertSize = 0.0;
  var showAlert = false;
  var showBlur = false;
  var blur = 0.0;

  @override
  void initState() {
    super.initState();
    _populateOffersArticles();
  }

  void _populateOffersArticles() {
    Webservice().load(OfferArticle.all).then((offerArticles) => {
          setState(() => {_offerArticles = offerArticles})
        });
  }

  @override
  Widget build(BuildContext context) {
    if (!showAlert) {
      alertSize = 0;
    } else {
      alertSize = 287;
    }

    if (!showBlur) {
      blur = 10;
    } else {
      blur = 10;
    }

    if (_offerArticles.isNotEmpty) {
      return Stack(children: <Widget>[
        ListView.builder(
          itemCount: _offerArticles.length,
          padding: const EdgeInsets.only(top: 10.0),
          itemBuilder: (BuildContext context, int index) {
            return Container(

                //Card height
                height: 520.0,

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
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => new Profile(
                                    urlImage: _offerArticles[index]),
                              ));
                        },
                        child: Material(
                          elevation: 8,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Container(
                              constraints: BoxConstraints.tightFor(
                                  height: 236, width: 380),
                              child: Stack(children: <Widget>[
                                Image.network(
                                  _offerArticles[index].urlToImage,
                                  height: 236,
                                  width: 380,
                                  fit: BoxFit.cover,
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        gradient: LinearGradient(
                                            begin: FractionalOffset.topCenter,
                                            end: FractionalOffset.bottomCenter,
                                            colors: [
                                              Colors.grey.withOpacity(0.0),
                                              Colors.black,
                                            ],
                                            stops: [
                                              0.0,
                                              1.0
                                            ])),
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8, 0, 0, 10),
                                      child: Text(
                                        _offerArticles[index].userName,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17.0,
                                        ),
                                      ),
                                    )),
                              ]),
                            ),
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
                                      Text(_offerArticles[index].price)
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
                                  Icon(Icons.access_time,
                                      color: Colors.red[900]),
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
                                      Text(_offerArticles[index].time)
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
                        padding: const EdgeInsets.only(
                            left: 10.0, top: 8.0, right: 10.0),
                        child: Text(
                          _offerArticles[index].title,

                          //"Встреча",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                      // Description text
                      Padding(
                        padding: const EdgeInsets.fromLTRB(11.0, 10, 9.0, 1),
                        child: Text(
                          _offerArticles[index].description,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                          ), // doesnt work well
                        ),
                      ),
                      Container(
                        height: 10,
                      ),
                      // Tags
                      // Button @TODO add gradient
                      RaisedButton(
                        onPressed: () {
                          setState(() {
                            showAlert = !showAlert;
                            showBlur = !showBlur;
                          });
                        },
                        textColor: Colors.white,
                        padding: const EdgeInsets.all(0.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: <Color>[
                                    Color.fromRGBO(239, 120, 120, 1),
                                    Color.fromRGBO(224, 81, 81, 1)
                                  ]),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(80.0))),
                          padding: const EdgeInsets.all(15),
                          child: const Text(
                            "Отправить предложение",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
          },
        ),

        AnimatedOpacity(
          duration: Duration(milliseconds: 0),
          opacity: showBlur ? 1.0 : 0.0,
          child: BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(
              color: Colors.transparent,
              height: 1,
            ),
          ),
        ),

        //Splash alert part
        Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            height: alertSize,
            curve: Curves.ease,
            child: SingleChildScrollView(
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(19.0))),
                elevation: 5,
                margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Введите встречную цену или комментарий ",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    //Place for input
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: TextField(
                        decoration: InputDecoration.collapsed(hintText: 'Цена'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Divider(),

                    //Alert message
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 37, 0),
                      child: Text(
                        "Внимение.  Оплата сделки происходит при встрече с заказчиком.",
                        style: TextStyle(
                            color: Colors.red,
                            fontFamily: "Monteserrat",
                            fontSize: 14),
                      ),
                    ),
                    Container(
                      height: 30,
                    ),
                    // Button settings
                    Padding(
                      padding: const EdgeInsets.only(bottom: 90.0),
                      child: Container(
                        // Red glow effect
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.red[100],
                                  blurRadius: 6.0,
                                  spreadRadius: 0.0,
                                  offset: Offset(1.0, 1.0))
                            ]),
                        // Button himself
                        child: ButtonTheme(
                          minWidth: 300.0,
                          height: 44,
                          child: RaisedButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22.0)),
                            child: Text(
                              "Отправить",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600),
                            ),
                            onPressed: () {
                              setState(() {
                                showAlert = !showAlert;
                                showBlur = !showBlur;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]);
    } else {
      return MyLoading();
    }
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:in_flutter/components/card_text.dart';
import 'package:in_flutter/components/loading.dart';
import 'package:in_flutter/components/my_app_bar.dart';
import 'package:in_flutter/components/my_bottom_nav_bar.dart';
import 'package:in_flutter/components/price_and_time.dart';
import 'package:in_flutter/models/requests_article.dart';
import 'package:in_flutter/services/webservice.dart';

class RequestSlider extends StatefulWidget {
  @override
  _RequestSliderState createState() => _RequestSliderState();
}

class _RequestSliderState extends State<RequestSlider>
    with TickerProviderStateMixin {
  List<RequestsArticle> _requestsArticles = List<RequestsArticle>();

  void _populateRequestsArticles() {
    Webservice().load(RequestsArticle.all).then((requestsArticles) => {
          setState(() => {_requestsArticles = requestsArticles})
        });
  }

  @override
  void initState() {
    super.initState();
    _populateRequestsArticles();
  }

  @override
  Widget build(BuildContext context) {
    CardController controller; //Use this to trigger swap.

    if (_requestsArticles.isNotEmpty) {
      return Scaffold(
          appBar: MyAppBar(
            titleText: "Запросы",
            showBack: true,
            showEdit: false,
            showSearch: false,
          ),
          body: prefix0.SingleChildScrollView(
            child: new Center(
                child: Container(
                    height: 590,
                    child: new TinderSwapCard(
                        orientation: AmassOrientation.BOTTOM,
                        totalNum: _requestsArticles.length,
                        stackNum: 3,
                        swipeEdge: 4.0,
                        maxWidth: MediaQuery.of(context).size.width * 0.9,
                        maxHeight: 600 * 0.9,
                        minWidth: MediaQuery.of(context).size.width * 0.8,
                        minHeight: 600 * 0.8,
                        cardBuilder: (context, index) => Card(
                              child: SingleChildScrollView(
                                child: Container(
                                    child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0))),
                                      elevation: 5,
                                      child: Stack(
                                        children: <Widget>[
                                          Image.network(
                                            _requestsArticles[index].urlToImage,
                                            height: 236,
                                            width: 380,
                                            fit: BoxFit.fill,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 200.0, left: 10),
                                            child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text(
                                                    _requestsArticles[index]
                                                        .userName,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600))),
                                          )
                                        ],
                                      ),
                                    ),
                                    PriceAndTime(
                                        data: _requestsArticles[index]),
                                    CardText(data: _requestsArticles[index]),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12.0, top: 10),
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Комментарий:",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.red[900]),
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12.0, top: 5),
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            _requestsArticles[index]
                                                .userComment,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          )),
                                    )
                                  ],
                                )),
                              ),
                            ),
                        cardController: controller = CardController(),
                        swipeUpdateCallback:
                            (DragUpdateDetails details, Alignment align) {
                          /// Get swiping card's alignment
                          if (align.x < 0) {
                            //Card is LEFT swiping
                          } else if (align.x > 0) {
                            //Card is RIGHT swiping
                          }
                        },
                        swipeCompleteCallback:
                            (CardSwipeOrientation orientation, int index) {
                          /// Get orientation & index of swiped card!
                        }))),
          ),
          //BottomNavBar
          bottomNavigationBar: MyBottomAppBar());
    } else {
      return Scaffold(
        appBar: MyAppBar(
          titleText: "Запросы",
          showBack: true,
          showEdit: false,
          showSearch: false,
        ),
        body: MyLoading(),
        bottomNavigationBar: MyBottomAppBar(),
      );
    }
  }
}

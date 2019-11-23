import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:in_flutter/components/my_app_bar.dart';
import 'package:in_flutter/components/my_bottom_nav_bar.dart';
import 'package:in_flutter/components/price_and_time.dart';
import 'package:in_flutter/models/offer_article.dart';
import 'package:in_flutter/services/webservice.dart';

class RequestSlider extends StatefulWidget {
  @override
  _RequestSliderState createState() => _RequestSliderState();
}

class _RequestSliderState extends State<RequestSlider>
    with TickerProviderStateMixin {
  List<String> welcomeImages = [
    "assets/welcome0.png",
    "assets/welcome1.png",
    "assets/welcome2.png",
    "assets/welcome2.png",
    "assets/welcome1.png",
    "assets/welcome1.png"
  ];
  List<OfferArticle> _offerArticles = List<OfferArticle>();

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
    CardController controller; //Use this to trigger swap.

    return new Scaffold(
        appBar: MyAppBar(
          titleText: "Запросы",
          showBack: true,
        ),
        body: new Center(
            child: Container(
                height: 600,
                child: new TinderSwapCard(
                    orientation: AmassOrientation.BOTTOM,
                    totalNum: welcomeImages.length,
                    stackNum: 3,
                    swipeEdge: 4.0,
                    maxWidth: MediaQuery.of(context).size.width * 0.9,
                    maxHeight: 600 * 0.9,
                    minWidth: MediaQuery.of(context).size.width * 0.8,
                    minHeight: 600 * 0.8,
                    cardBuilder: (context, index) => Card(
                          child: Container(
                              child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0))),
                                elevation: 5,
                                child: Image.network(
                                  _offerArticles[index].urlToImage,
                                  height: 236,
                                  width: 380,
                                  fit: BoxFit.fill,
                                ),
                              ),
                             PriceAndTime(data: _offerArticles[index]), 
                            ],
                          )),
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
        //BottomNavBar
        bottomNavigationBar: MyBottomAppBar());
  }
}

class CardExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:in_flutter/components/my_app_bar.dart';
import 'package:in_flutter/components/my_bottom_nav_bar.dart';

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

  @override
  Widget build(BuildContext context) {
    CardController controller; //Use this to trigger swap.

    return new Scaffold(
      appBar: MyAppBar(titleText: "Запросы", showBack: true,), 

      body: new Center(
          child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              child: new TinderSwapCard(
                  orientation: AmassOrientation.BOTTOM,
                  totalNum: welcomeImages.length,
                  stackNum: 3,
                  swipeEdge: 4.0,
                  maxWidth: MediaQuery.of(context).size.width * 0.9,
                  maxHeight: MediaQuery.of(context).size.width * 0.9,
                  minWidth: MediaQuery.of(context).size.width * 0.8,
                  minHeight: MediaQuery.of(context).size.width * 0.8,
                  cardBuilder: (context, index) => Card(
                        child: Image.asset('${welcomeImages[index]}'),
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
      bottomNavigationBar: MyBottomAppBar()
    );
  }
}

class CardExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
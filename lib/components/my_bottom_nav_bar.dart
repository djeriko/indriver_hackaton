import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_flutter/pages/request_slider.dart';

class MyBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
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
    );
  }
}

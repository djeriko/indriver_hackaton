import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  var titleText = "asd";
  var showBack = false;

  MyAppBar({Key key, this.titleText, this.showBack}) : super(key: key);

  @override

  Widget build(BuildContext context) {

    return AppBar(
      leading: showBack ? IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      ) : null,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.add, color: Colors.red[900]),
            onPressed: () {},
          ),
          Text(
            titleText,
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
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

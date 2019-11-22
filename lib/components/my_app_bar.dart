import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return 
      AppBar(
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
      );
  }

  @override 

  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_flutter/pages/edit_profile.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  var titleText = "asd";
  var showBack = false;
  var showEdit = false;
  var showSearch = true;

  MyAppBar({Key key, this.titleText, this.showBack, this.showSearch, this.showEdit}) : super(key: key);

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
        showSearch ? new IconButton(
          icon: Icon(Icons.search),
          color: Colors.black,
          onPressed: () {},
        ) : Container(),
        new IconButton(
          icon: Icon(Icons.message, color: Colors.black),
          onPressed: () {},
        ),
        showEdit ? new IconButton(
          icon: Icon(Icons.edit, color: Colors.black),
          onPressed: (){
            Navigator.push(context, CupertinoPageRoute(builder: (context)=> new EditProfile()));
          },
          color: Colors.black,
        ) : Container()
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

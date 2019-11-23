import 'package:flutter/material.dart';
import 'package:in_flutter/components/my_app_bar.dart';
import 'package:in_flutter/components/my_bottom_nav_bar.dart';

class MyMessages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(titleText: "Сообщения", showBack: true, showEdit: false, showSearch: false,),
        body: Container(),
        bottomNavigationBar: MyBottomAppBar(),
    );
  }
}
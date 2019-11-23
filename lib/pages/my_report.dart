import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:in_flutter/components/my_app_bar.dart';
import 'package:in_flutter/components/my_bottom_nav_bar.dart';

class MyReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        titleText: "Жалоба",
        showBack: true,
        showEdit: false,
        showSearch: false,
      ),
      body: prefix0.Container(),
      bottomNavigationBar: MyBottomAppBar(),
    );
  }
}

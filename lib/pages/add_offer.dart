import 'package:flutter/material.dart';
import 'package:in_flutter/components/my_app_bar.dart';
import 'package:in_flutter/components/my_bottom_nav_bar.dart';

class AddOffer extends StatefulWidget {
  @override
  _AddOfferState createState() => _AddOfferState();
}

class _AddOfferState extends State<AddOffer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        titleText: "Добавить услугу",
        showBack: true,
      ),
      body: Container(
        // Text style
        child: DefaultTextStyle(
          style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.w600),
          child: Column(
            children: <Widget>[
              // Title part
              Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: <Widget>[
                      Text("Заголовок", textAlign: TextAlign.center,),
                      TextField(
                        decoration: InputDecoration.collapsed(
                            hintText: "Введите заголовок услуги"),
                        onChanged: (val) {},
                      ),
                      Divider(),
                    ],
                  )),

              // Description part
              Text("Описание"),
              TextField(
                decoration:
                    InputDecoration.collapsed(hintText: "Введите текст"),
                onChanged: (val) {},
              ),
              Divider(),

              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text("Цена"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomAppBar(),
    );
  }
}

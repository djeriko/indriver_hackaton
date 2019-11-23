import 'package:flutter/material.dart';
import 'package:in_flutter/components/my_app_bar.dart';
import 'package:in_flutter/components/my_bottom_nav_bar.dart';
import 'package:in_flutter/models/new_offer.dart';
import 'package:in_flutter/constants/constants.dart';
import 'package:in_flutter/services/webservice.dart';

class AddOffer extends StatefulWidget {
  @override
  _AddOfferState createState() => _AddOfferState();
}

class _AddOfferState extends State<AddOffer> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final timeController = TextEditingController();
  final tagsController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    timeController.dispose();
    tagsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: MyAppBar(
        showEdit: false,
        showSearch: false,
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
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                // Title part
                Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Заголовок",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          height: 15,
                        ),
                        TextField(
                          controller: titleController,
                          decoration: InputDecoration.collapsed(
                              hintText: "Введите заголовок услуги"),
                        ),
                        Divider(),
                      ],
                    )),
                //Divide
                Container(
                  height: 20,
                ),

                // Description part
                Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Описание",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          height: 15,
                        ),
                        TextField(
                          controller: descriptionController,
                          decoration: InputDecoration.collapsed(
                              hintText: "Введите описание услуги"),
                          onChanged: (val) {},
                        ),
                        Divider(),
                      ],
                    )),

                // Divide
                Container(
                  height: 10,
                ),

                // Price part
                Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Цена",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          height: 15,
                        ),
                        TextField(
                          controller: priceController,
                          decoration: InputDecoration.collapsed(
                              hintText: "Услуга или руб"),
                        ),
                        Divider(),
                      ],
                    )),

                // Time part
                Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Время",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          height: 15,
                        ),
                        TextField(
                          controller: timeController,
                          decoration: InputDecoration.collapsed(
                              hintText: "00:00",
                              hintStyle: TextStyle(
                                  color: Colors.red[900],
                                  fontWeight: FontWeight.w600)),
                          onChanged: (val) {},
                        ),
                        Divider(),
                      ],
                    )),

                // Tags part
                Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Теги",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          height: 15,
                        ),
                        TextField(
                          controller: tagsController,
                          decoration: InputDecoration.collapsed(
                            hintText: "Введите теги через запятую",
                          ),
                          onChanged: (val) {},
                        ),
                        Divider(),
                      ],
                    )),

                Container(
                  height: 30,
                ),
                // Button part
                ButtonTheme(
                  minWidth: 300.0,
                  height: 44,
                  child: RaisedButton(
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0)),
                    child: Text(
                      "Отправить предложение",
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'Montserrat'),
                    ),
                    onPressed: () async {
                      print("asd");
                      NewOffer newOffer = new NewOffer(
                          title: titleController.value.text,
                          description: descriptionController.value.text, 
                          price: priceController.value.text,
                          time: timeController.value.text, 
                          tags: tagsController.value.text,
                          urlToImage:
                              "http://coolmenshair.com/wp-content/uploads/Asian-hairstyles-for-men-6.jpg",
                          likes: '3',
                          userName: "Лев Толстой",
                          userId: "4",
                          userAge: '35',
                          userAbout:
                              "Пишу книги. Играю в футбол. Сажаю яблоки у себя в саду",
                          city: 'Yakutsk');
                      NewOffer p = await createPost(
                          Constants.HEADLINE_OFFERS_URL,
                          body: newOffer.toMap());
                      Navigator.pop(context);
                      print(p.title);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: MyBottomAppBar(),
    );
  }
}

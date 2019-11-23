import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:in_flutter/components/my_app_bar.dart';
import 'package:in_flutter/components/my_bottom_nav_bar.dart';

class MyMessages extends StatelessWidget {
  List<String> dummyItems = [
    'Стручков Вадим',
    'Михайлова Елизавета',
    'Винокурова Елена'
  ];

  List<String> dummyImages = [
    'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://images.pexels.com/photos/157661/young-woman-shooting-model-157661.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://www.the-efa.org/wp-content/uploads/2018/10/20170708_172857_HDR-2-1-640x640.jpg'
  ];

  List<String> dummyAnswer = [
    'Прислал Вам сообщение',
    'Отклонила Ваше предложение',
    'Отклонила Ваше предложение'
  ];

  List<String> dummyDate = [
    '11:10 23.11.2019',
    '15:40 23.11.2019',
    '18:00 23.11.2019'
  ];

  List<Color> dummyColors = [
      Colors.green.withOpacity(0.5),
      Colors.red.withOpacity(0.5),
      Colors.red.withOpacity(0.5)

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        titleText: "Сообщения",
        showBack: true,
        showEdit: false,
        showSearch: false,
      ),
      body: Container(
          child: ListView.builder(
        itemCount: 3,
        padding: const prefix0.EdgeInsets.all(2.0),
        itemBuilder: (prefix0.BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: prefix0.Container(
              height: 100,
              child: Row(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        decoration: prefix0.BoxDecoration(
                            shape: prefix0.BoxShape.circle,
                            image: prefix0.DecorationImage(
                                image: prefix0.NetworkImage(dummyImages[index]),
                                fit: BoxFit.fitHeight)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 60.0),
                        child: prefix0.Container(
                          width: 35,
                          height: 35,
                          child: Icon(Icons.compare_arrows),
                          decoration: prefix0.BoxDecoration(
                              shape: prefix0.BoxShape.circle, color: dummyColors[index]),
                        ),
                      ),
                    ],
                  ),
                  prefix0.Container(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: prefix0.CrossAxisAlignment.start,
                    mainAxisAlignment: prefix0.MainAxisAlignment.start,
                    mainAxisSize: prefix0.MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        dummyItems[index],
                        style: prefix0.TextStyle(
                            fontSize: 18,
                            fontWeight: prefix0.FontWeight.w600,
                            fontFamily: "Montserrat"),
                      ),
                      prefix0.Container(height: 4,),
                      Text(
                        dummyAnswer[index],
                        style: prefix0.TextStyle(
                            fontFamily: "Montserrat", fontSize: 14),
                      ),
                      prefix0.Container(
                        height: 10,
                      ),
                      Text(
                        dummyDate[index],
                        style: prefix0.TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 14,
                            color: Colors.black54),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      )),
      bottomNavigationBar: MyBottomAppBar(),
    );
  }
}

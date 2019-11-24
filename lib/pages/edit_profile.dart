import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:in_flutter/components/my_app_bar.dart';
import 'package:in_flutter/components/my_bottom_nav_bar.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final surnameController = TextEditingController();
  final nameController = TextEditingController();
  final myselfController = TextEditingController();
  final tagsController = TextEditingController();
  //sities
  List _cities = ["Якутск", "Покровск", "Марха", "Нюрьба", "Нью-Йорк"];
  //
  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentCity;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentCity = _dropDownMenuItems[0].value;
    super.initState();
  }
  //

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String city in _cities) {
      items.add(new DropdownMenuItem(value: city, child: new Text(city)));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: MyAppBar(
        titleText: "Настройки",
        showBack: true,
        showEdit: false,
        showSearch: false,
      ),
      body: Column(
        children: <Widget>[
          prefix0.Stack(
            children: <Widget>[
              prefix0.Padding(
                //start of avatar
                padding: prefix0.EdgeInsets.fromLTRB(0, 20, 0, 0),

                child: prefix0.Container(
                  width: 110,
                  height: 110,
                  decoration: new prefix0.BoxDecoration(
                    shape: prefix0.BoxShape.circle,
                    image: DecorationImage(
                        fit: prefix0.BoxFit.fitHeight,
                        image: new prefix0.NetworkImage(
                            "https://media.gettyimages.com/photos/portrait-of-a-beautifull-smiling-man-picture-id499907722?b=1&k=6&m=499907722&s=612x612&w=0&h=dhMh0LqBXtlh5yxZVxrtsujlSft4YLb5mNthPkj8Pss=")),
                  ),
                ), //end of avatar
              ),
              prefix0.Padding(
                padding: prefix0.EdgeInsets.only(left: 80, top: 90),
                child: prefix0.Container(
                  child: prefix0.Icon(
                    prefix0.Icons.edit,
                    color: prefix0.Colors.white,
                  ),
                  width: 42,
                  height: 42,
                  decoration: new prefix0.BoxDecoration(
                      shape: prefix0.BoxShape.circle,
                      color: prefix0.Colors.pink),
                ),
              ),
            ],
          ),
          prefix0.TextField(
            controller: surnameController,
            decoration: InputDecoration.collapsed(hintText: "Фамилия"),
          ),
          prefix0.Divider(),

          prefix0.TextField(
            controller: nameController,
            decoration: InputDecoration.collapsed(hintText: "Имя"),
          ),
          prefix0.Divider(),

          //Select city
          prefix0.Row(
            mainAxisAlignment: prefix0.MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Align(
                alignment: prefix0.Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: new Text(
                    "Ваш город ",
                    style: prefix0.TextStyle(
                        fontSize: 17, color: Colors.black.withOpacity(0.4)),
                  ),
                ),
              ),
              new prefix0.Padding(
                padding: new EdgeInsets.only(right: 0.0),
                child: new DropdownButton(
                  value: _currentCity,
                  items: _dropDownMenuItems,
                  onChanged: changedDropDownItem,
                ),
              ),
            ],
          ),
          prefix0.Divider(),
//birthDate
          Row(
            mainAxisAlignment: prefix0.MainAxisAlignment.spaceBetween,
            children: <Widget>[
              prefix0.Align(
                alignment: prefix0.Alignment.centerLeft,
                child: Text(
                  "Дата рождения",
                  style: prefix0.TextStyle(
                      fontSize: 17, color: Colors.black.withOpacity(0.4)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: prefix0.Text(
                  'Не указано',
                  style: prefix0.TextStyle(color: prefix0.Colors.red),
                ),
              )
            ],
          ),
          prefix0.Divider(),
          //sex
          Row(
            mainAxisAlignment: prefix0.MainAxisAlignment.spaceBetween,
            children: <Widget>[
              prefix0.Align(
                alignment: prefix0.Alignment.centerLeft,
                child: Text(
                  "Пол",
                  style: prefix0.TextStyle(
                      fontSize: 17, color: Colors.black.withOpacity(0.4)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: prefix0.Text(
                  'Не указано',
                  style: prefix0.TextStyle(color: prefix0.Colors.red),
                ),
              )
            ],
          ),
          prefix0.Divider(),

          //about myself
          prefix0.TextField(
            controller: myselfController,
            decoration: InputDecoration.collapsed(hintText: "Напишите о себе"),
          ),
          prefix0.Divider(),
//tags
          prefix0.TextField(
            controller: tagsController,
            decoration: InputDecoration.collapsed(
                hintText: "Введите теги через запятую"),
          ),
          prefix0.Divider(),

          prefix0.Padding(
            padding: prefix0.EdgeInsets.only(top: 30),
            child: prefix0.Container(
              child: prefix0.Text("Политика конфеденциальности",
                  style: prefix0.TextStyle(
                      color: prefix0.Colors.red, fontSize: 17)),
            ),
          ),

          prefix0.Padding(
            padding: prefix0.EdgeInsets.only(top: 20),
            child: prefix0.Container(
              child: prefix0.Text(
                "Лицензионное соглашение",
                style:
                    prefix0.TextStyle(color: prefix0.Colors.red, fontSize: 17),
              ),
            ),
          )
        ],
      ),
    );
  }

  void changedDropDownItem(String selectedCity) {
    setState(() {
      _currentCity = selectedCity;
    });
  }
}
//

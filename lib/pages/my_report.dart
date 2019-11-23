import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:in_flutter/components/my_app_bar.dart';
import 'package:in_flutter/components/my_bottom_nav_bar.dart';

class MyReport extends StatefulWidget {
  @override
  _MyReportState createState() => _MyReportState();
}

class _MyReportState extends State<MyReport> {
  
  String _radioValue; //Initial definition of radio button value
  String choice;
  int selectedRadio;
  final surnameController = TextEditingController();
  int selectedRadioTile;


  
 @override
 void initState(){
   super.initState();selectedRadio=0;
   selectedRadioTile = 0;


 }
 setSelectedRadio(int val){
   setState(() {
    selectedRadio = val ;
   });
 }
 setSelectedRadioTile(int val){
   setState(() {
    selectedRadioTile = val ;
   });
 }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: MyAppBar(
        titleText: "Жалоба",
        showBack: true,
        showEdit: false,
        showSearch: false,
      ),
      body: prefix0.Column(
        mainAxisAlignment: prefix0.MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: prefix0.RadioListTile(
              value:1,
              groupValue: selectedRadioTile,
              title: Text("Фотография непристойного характера"),
              onChanged: (val){
                print("radio tile pressed $val");
                setSelectedRadioTile(val);
              },
              activeColor: prefix0.Colors.red,
              
              selected: false,
            ),
          ),


           Padding(
             padding: const EdgeInsets.all(8.0),
             child: prefix0.RadioListTile(
              value:2,
              groupValue: selectedRadioTile,
              title: Text("Информация непристойного характера"),
             onChanged: (val){
                print("radio tile pressed $val");
                   setSelectedRadioTile(val);
              },
              activeColor: prefix0.Colors.red,
             selected: false,
          ),
           ),


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: prefix0.RadioListTile(
              value:3,
              groupValue: selectedRadioTile,
              title: Text("Другое"),
            onChanged: (val){
                print("radio tile pressed $val");
                   setSelectedRadioTile(val);
              },
              activeColor: prefix0.Colors.red,
              selected: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: prefix0.Text("Комментарий жалобы",style:prefix0.TextStyle(color: prefix0.Colors.black,fontSize: 17,fontWeight:prefix0.FontWeight.w600)),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
            child: prefix0.TextField( controller: surnameController,
                            decoration: InputDecoration.collapsed(
                                hintText: "Введите комментарий жалобы"),

                         ),
          ),
                       Padding(
                         padding: const EdgeInsets.only(right: 20,left: 20,top: 10  ),
                         child: prefix0.Divider(),
                       )


        ],
      ),
      bottomNavigationBar: MyBottomAppBar(),
    );
  }
}


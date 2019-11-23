import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:in_flutter/components/my_app_bar.dart';
import 'package:in_flutter/components/my_bottom_nav_bar.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(titleText: "Настройки", showBack: true, showEdit: false, showSearch: false,),
      body: prefix0.
Row(
children: <Widget>[     
  prefix0.Padding(  //start of avatar
  padding:prefix0.EdgeInsets.fromLTRB(150, 20, 0, 0),
  child: prefix0.Padding(
    padding: prefix0.EdgeInsets.fromLTRB(0, 0, 0, 0),
    child: prefix0.Container(
    width: 110,height: 110,decoration: new prefix0.BoxDecoration(
           shape: prefix0.BoxShape.circle,
           image:  DecorationImage(
             fit: prefix0.BoxFit.fill,
             image: new prefix0.NetworkImage(
               "https://www.handwerk.com/drimage/1120/630/3277/hide-pain-harold-title-red%20-web.jpg"
               )
             ),
         ),
         ),//end of avatar
  )
  ),prefix0.Padding(padding: prefix0.EdgeInsets.only(left: 0,top:10),
    child:  prefix0.Container(width: 42,height: 42,decoration: new prefix0.BoxDecoration(
           shape: prefix0.BoxShape.circle,color: prefix0.Colors.pink
  ),
         ),
         ),

         

],





  //       child: prefix0.Padding(

  //         padding: prefix0.EdgeInsets.fromLTRB(150,20,0,0),
  //         child: prefix0.Column(children: <Widget>[
  //           //start of avatar
  //        prefix0.Container(width: 110,height: 110,decoration: new prefix0.BoxDecoration(
  //          shape: prefix0.BoxShape.circle,
  //          image:  DecorationImage(
  //            fit: prefix0.BoxFit.fill,
  //            image: new prefix0.NetworkImage(
  //              "https://www.handwerk.com/drimage/1120/630/3277/hide-pain-harold-title-red%20-web.jpg"
  //              )
  //            ),
  //        ),
  //        ),//end of avatar

  // prefix0.Container(width: 42,height: 42,decoration: new prefix0.BoxDecoration(
  //          shape: prefix0.BoxShape.circle,color: prefix0.Colors.pink
         
  //        ),
  //        ),

  //        ],)
  //       ),
      ),
      bottomNavigationBar: MyBottomAppBar(),
    );
  }
}
//
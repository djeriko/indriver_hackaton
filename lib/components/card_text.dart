import 'package:flutter/material.dart';

class CardText extends StatelessWidget {
  final data;
  CardText({Key key, this.data});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        //Main info text
        Padding(
          padding: const EdgeInsets.fromLTRB(11.0, 11.0, 0 ,0 ),
          child: Text(
            data.title,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontFamily: 'Montserrat'),
          ),
        ),
        // Description text
        Padding(
          padding: const EdgeInsets.fromLTRB(11.0, 10, 9.0, 1),
          child: Text(
            data.description,
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Montserrat',
            ), // doesnt work well
          ),
        ),
      ],
    ));
  }
}

import 'package:flutter/material.dart';

class PriceAndTime extends StatelessWidget {
  @override
  final data;
  PriceAndTime({Key key, this.data});
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //Price
            Row(
              children: <Widget>[
                Icon(
                  Icons.attach_money,
                  color: Colors.red[900],
                ),
                Container(
                  width: 10,
                ),
                Column(
                  children: <Widget>[
                    Text("Цена", style: TextStyle(color: Colors.black38)),
                    Divider(
                      height: 4,
                    ),
                    Text(data.price)
                  ],
                )
              ],
            ),
            //Divider
            Container(
              height: 40,
              width: 1,
              color: Colors.black38,
            ),
            //Time
            Row(
              children: <Widget>[
                Icon(Icons.access_time, color: Colors.red[900]),
                Container(
                  width: 10,
                ),
                Column(
                  children: <Widget>[
                    Text("Время", style: TextStyle(color: Colors.black38)),
                    Divider(
                      height: 4,
                    ),
                    Text(data.time)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

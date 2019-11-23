import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class MyLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 100,
          height: 100,
           child: FlareActor(
             'animations/asd.flr',
             animation: 'Alarm',
             fit: BoxFit.contain
           ),
      ),
    );
  }
}
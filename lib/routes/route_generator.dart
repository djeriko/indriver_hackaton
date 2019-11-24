// import 'package:flutter/material.dart';
// import 'package:in_flutter/main.dart';
// import 'package:in_flutter/pages/add_offer.dart';

// class RouteGenerator {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     final args = settings.arguments;

//     switch (settings.name) {
//       case '/': return MaterialPageRoute(builder: (_) => ExampleHomePage());
//       case '/addoffer': if (args is String) {
//         return MaterialPageRoute(builder: (_) => AddOffer());
//       }
//       return _errorRoute()
//     }
//   }
// }

// static Route<dynamic> _errorRoute() {
//   return MaterialPageRoute(builder: (_) {
//     return Scaffold(
//       appBar: AppBar(),
//     )
//   })
// }
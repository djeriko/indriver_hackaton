import 'dart:convert';
import 'package:in_flutter/constants/constants.dart';
import 'package:in_flutter/services/webservice.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NewOffer {
  final String title;
  final String description;
  final String price;
  final String time;
  final String tags;

  NewOffer({this.title, this.description, this.price, this.time, this.tags});

  factory NewOffer.fromJson(Map<String,dynamic> json) {
    return NewOffer(
      title: json['title'],
      description: json['description'],
      price: json['price'],
      time: json['time'],
      tags: json['tags']
    );
  }
  Map toMap() {
    var map = new Map<String, dynamic>();
    map['title'] = title;
    map['description'] = description;
    map['price'] = price;
    map['time'] = time;
    map['tags'] = tags;

    return map;
  }
}
// class WebservicePost {
//   Future<NewOffer> createPost(String url, {Map body}) async {
//     return http.post(url, body: body).then((http.Response response) {
//       final int statusCode = response.statusCode;

//       if (statusCode < 200 || statusCode > 400 || json ==null) {
//         throw new Exception("Error while fetching data");
//       }
//       return NewOffer.fromJson(json.decode(response.body));
//     });
//   }
// }


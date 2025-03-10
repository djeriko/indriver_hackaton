import 'dart:convert';
import 'package:in_flutter/constants/constants.dart';
import 'package:in_flutter/services/webservice.dart';

class OfferArticle {
  final String title;
  final String description;
  final String urlToImage;
  final String time;
  final String city;
  final String price;
  final int likes;
  final String userName;
  final String userId;
  final String userAge;
  final String userAbout;
  //add time and price

  OfferArticle(
      {this.title,
      this.description,
      this.urlToImage,
      this.time,
      this.city,
      this.price,
      this.likes,
      this.userName,
      this.userId,
      this.userAge,
      this.userAbout});

  factory OfferArticle.fromJson(Map<String, dynamic> json) {
    return OfferArticle(
        title: json['title'],
        description: json['description'],
        urlToImage: json['urlToImage'],
        time: json['time'],
        city: json['city'],
        price: json['price'],
        likes: json['likes'],
        userName: json['userName'],
        userAge: json['userAge'],
        userId: json['userId'],
        userAbout: json['userAbout']);
  }

  static Resource<List<OfferArticle>> get all {
    return Resource(
        url: Constants.HEADLINE_OFFERS_URL,
        parse: (response) {
          final result = json.decode(response.body);
          print("123 ${response.body}");
          Iterable list = result;
          return list.map((model) => OfferArticle.fromJson(model)).toList();
        });
  }
}

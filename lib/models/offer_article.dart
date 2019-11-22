import 'dart:convert';
import 'package:in_flutter/constants/constants.dart';
import 'package:in_flutter/services/webservice.dart';

class OfferArticle {
  final String title;
  final String description;
  final String urlToImage;
  //add time and price

  OfferArticle({this.title, this.description, this.urlToImage});

  factory OfferArticle.fromJson(Map<String,dynamic> json) {
    return OfferArticle(
      title: json['title'],
      description: json['description'],
      urlToImage: json['urlToImage']
    );
  }

  static Resource<List<OfferArticle>> get all {

    return Resource(
      url: Constants.HEADLINE_OFFERS_URL,
      parse: (response) {
        final result = json.decode(response.body);
        Iterable list = result['article'];
        return list.map((model)=>OfferArticle.fromJson(model)).toList();
      }
    );
  }
}


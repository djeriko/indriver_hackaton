import 'dart:convert';
import 'package:in_flutter/constants/constants.dart';
import 'package:in_flutter/services/webservice.dart';

class RequestsArticle {
  final String title;
  final String description;
  final String urlToImage;
  final String time;
  final String city;
  final String price;
  final String likes;
  final String userName;
  final String userId;
  final String userAge;
  final String userAbout;
  final String userComment;

  RequestsArticle(
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
      this.userAbout,
      this.userComment});

      factory RequestsArticle.fromJson(Map<String, dynamic>json) {
        return RequestsArticle(
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
        userAbout: json['userAbout'],
        userComment: json['userComment']);
      }

      static Resource<List<RequestsArticle>> get all {
        return Resource(
          url: Constants.REQUESTS_URL,
          parse: (response) {
            final result = json.decode(response.body);
            print("yo ${response.body}");
            Iterable list = result;
            return list.map((model) => RequestsArticle.fromJson(model)).toList();
          }
        );
      }
}



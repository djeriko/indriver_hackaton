import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:in_flutter/constants/constants.dart';
import 'package:in_flutter/services/webservice.dart';

class MyProfileData {
  final String urlToImage;
  final String city;
  final int likes;
  final String userName;
  final String userId;
  final String userAge;
  final String userAbout;
  //add time and price

  MyProfileData({ this.urlToImage, this.city, this.likes, this.userName, this.userId, this.userAge, this.userAbout});

  factory MyProfileData.fromJson(Map<String,dynamic> json) {
    return MyProfileData(
      urlToImage: json['urlToImage'],
      city: json['city'],
      likes: json['likes'],
      userName: json['userName'],
      userAge: json['userAge'],
      userId: json['userId'],
      userAbout: json['userAbout']
    );
  }

  static Resource<List<MyProfileData>> get all {

    return Resource(
      url: Constants.PROFILES_URL,
      parse: (response) {
        final result = json.decode(response.body);
        print("123 ${response.body}");
        Iterable list = result;
        return list.map((model)=>MyProfileData.fromJson(model)).toList();
      }
    );
  }
}


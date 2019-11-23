import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:in_flutter/models/new_offer.dart';

class Resource<T> {
  final String url;
  T Function(Response response) parse;

  Resource({this.url, this.parse});
}

class Webservice {
  Future<T> load<T>(Resource<T> resource) async {
    final response = await http.get(resource.url);
    if(response.statusCode == 200) {
      return resource.parse(response);
    } else {
      throw Exception('Failed to load');
    }
  }
}

class WebservicePost {
  Future<NewOffer> createPost(String url, {Map body}) async {
    return http.post(url, body: body).then((http.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json ==null) {
        throw new Exception("Error while fetching data");
      }
      return NewOffer.fromJson(json.decode(response.body));
    });
  }
}
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/newsInfo.dart';

class API_Manager {
  Future<NewsModel> getNews() async {
    var clinet = http.Client();
    var newsModel = null;

    try {
      var response = await clinet.get('http://newsapi.org/v2/top-headlines?country=us&apiKey=2e6124c7bc9f42789a2a0e4b21477f6d');
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        newsModel = NewsModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsModel;
    }

    return newsModel;
  }
}

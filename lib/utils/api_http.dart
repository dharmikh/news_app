import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/Screen/model/NewsModel.dart';

class newsdata {
  Future<NewsModel?> getnewsdata(String search) async {
    print("Start");
    var response = await http.get(
      Uri.parse(
          "https://newsapi.org/v2/everything?q=$search&from=2023-01-14&sortBy=publishedAt&apiKey=943a584d6cfa4d88b53639dc28cdd042"),
    );
    print("response======");
    if(response.statusCode == 200)
      {
        var json = jsonDecode(response.body);
        print("==== $json");
        return NewsModel.fromJson(json);
      }
    else
      {
        print("ERROR 400");
        return null;
      }
  }
}

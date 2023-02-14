import 'package:flutter/cupertino.dart';
import 'package:news_app/Screen/model/NewsModel.dart';

class HomeProvider extends ChangeNotifier {
  TextEditingController txtSearch = TextEditingController();
  Articles? articles;

  void AddData(Articles data) {
    articles = data;
    notifyListeners();
  }
}

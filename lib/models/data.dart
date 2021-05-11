import 'package:flutter/foundation.dart';

class Data extends ChangeNotifier{
  List allList = [];
  List favoriteList = [];

  List get all => allList;
  List get favorites => favoriteList;

  void addList(data) async {
    allList =  [...data['articles'].map((article) => {...article, 'favorite': false})];
    notifyListeners();
  }

  void updateList(selectedNews) async {
    int favoriteIndex = favoriteList.indexWhere((item) => item['title'] == selectedNews['title']);
    allList = [...allList.map((article) {
      if (article['title'] == selectedNews['title']) {
        return  {...article, 'favorite': !article['favorite']};
      } else {
        return  article;
      }
    })];
    if (favoriteIndex == -1) {
      favoriteList.add({...selectedNews, 'favorite': true});
    } else {
      favoriteList.removeAt(favoriteIndex);
    }
    notifyListeners();
  }
}
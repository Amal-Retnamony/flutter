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


  void updateList(index) async {
    print(index);
    print([...allList.map((article) {
      if (allList.indexOf(article) == index) {
        return  {...article, 'favorite': !allList[index]['favorite']};
      } else {
        return  article;
      }
    })]);
    allList = [...allList.map((article) {
      if (allList.indexOf(article) == index) {
        return  {...article, 'favorite': !allList[index]['favorite']};
      } else {
        return  article;
      }
    })];
    notifyListeners();
  }


  void updateFavorite(item) {
    favoriteList.add(item);
    notifyListeners();
  }

  void removeFavorite(index) {
    favoriteList.removeAt(index);
    notifyListeners();
  }
}
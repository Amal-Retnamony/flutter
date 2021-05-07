import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsletter/components/newsCard.dart';
import 'package:newsletter/models/data.dart';
import 'package:provider/provider.dart';

class NewsList extends StatelessWidget {
  final bool isFavorite;
  NewsList(this.isFavorite);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NEWSLETTER'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Consumer<Data>(builder: (context, newsData, child) {
        num favLength = 0;
        List newsList = isFavorite ? [...newsData.allList.map((item) {
        if (item['favorite']) {
            favLength++;
            return item;
          } else {
            return {'title': ''};
          }
        })] : newsData.allList;
        return Container(
          color: Colors.grey[300],
          child:
              (!isFavorite ? newsList.length > 0 : favLength > 0)
              ? ListView.builder(
              itemCount: isFavorite ? favLength : newsList.length,
              itemBuilder: (context, index) {
                if (!newsList[index]['title'].isEmpty) {
                  return NewsCard(data: newsList[index], onPress: () {newsData.updateList(index);}, selectedIndex: index,);
                } else {
                  return null;
                }
              })
              : Center(child: const Text('No items')),
        );
      }),
    );
  }
}
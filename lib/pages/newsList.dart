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
        List newsList = isFavorite ? newsData.favorites : newsData.allList;
        return Container(
          color: Colors.grey[300],
          child:
              newsList.length > 0
              ? ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                return NewsCard(data: newsList[index], onPress: () {newsData.updateList(newsList[index]);}, selectedIndex: index,);
              })
              : Center(child: const Text('No items')),
        );
      }),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:newsletter/components/newsCard.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  List newsList = [];
  Future<void> getData() async {
    Response data = await get(Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=2fff597338b34e66a277888815e454a5'));
    print(data.body);
    Map convertedData = jsonDecode(data.body);
    setState(() {
      newsList = convertedData['articles'];
    });
    print(newsList.length);
  }
  @override
  void initState() {
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NEWSLETTER'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.grey[300],
        child: newsList.length > 0
               ? ListView.builder(
                    itemCount: newsList.length,
                    itemBuilder: (context, index) {
                      print(index);
                       return NewsCard(data: newsList[index]);
                 })
               : Center(child: const Text('No items')),
      ),
    );
  }
}
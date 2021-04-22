import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'details.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List newsList = [];

  Future<void> getData() async {
    Response data = await get(Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=2fff597338b34e66a277888815e454a5'));
    print(data.body);
    Map convertedData = jsonDecode(data.body);
    setState(() {
      newsList = convertedData['articles'];
    });
    print(newsList);
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
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: SingleChildScrollView(child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children:
          newsList.map((news) => NewsCard(data: news)).toList(),
      )
      )
    );
  }
}

class NewsCard extends StatelessWidget{
  Map data = {};
  NewsCard({this.data});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if(data['urlToImage'] != null)
              Expanded(child: Image(image: NetworkImage(data['urlToImage']), fit: BoxFit.fill), flex: 1),
            SizedBox(width: 10),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(child: Text(data['title'], style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ))),
                    RaisedButton.icon(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Details(detailsData: data)));
                    }, icon: Icon(Icons.read_more), label: Text('Read more'), ),
                  ],
                ),
              ),
            ),
          ],
        ),
        margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
      ),
    );
  }
}

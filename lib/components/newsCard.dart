import 'package:flutter/material.dart';
import 'package:newsletter/pages/details.dart';

class NewsCard extends StatelessWidget{
  Map data = {};
  NewsCard({this.data});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Details(detailsData: data)));
      },
      child: Container(
        height: 150,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if(data != null && data.containsKey('urlToImage') && data['urlToImage'] != null)
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
                      Flexible(child: Text(data != null ? data['title'] : 'title', style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ))),
                      IconButton(icon: Icon(Icons.favorite_outline), onPressed: (){}),
                    ],
                  ),
                ),
              ),
            ],
          ),
          margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
        ),
      ),
    );
  }
}
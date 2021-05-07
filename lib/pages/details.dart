import 'package:flutter/material.dart';
import 'package:newsletter/models/data.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Details extends StatelessWidget {
  final selectedIndex;
  Details(this.selectedIndex);
  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(
      builder: (context, newsData, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('DETAILS'),
            centerTitle: true,
            backgroundColor: Colors.blue,
          ),
          body: SingleChildScrollView(child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: Text(newsData.all[selectedIndex]['title'], style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),),
              ),
              Image(image: NetworkImage(newsData.all[selectedIndex]['urlToImage']),),
              SizedBox(height: 8),
              IconButton(
                icon: newsData.all[selectedIndex]['favorite'] ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
                onPressed: (){
                  newsData.updateList(selectedIndex);
                },
                color: newsData.all[selectedIndex]['favorite'] ? Colors.blue : Colors.black,
              ),
              SizedBox(height: 8),
              Text(newsData.all[selectedIndex]['content'], style: TextStyle(
                fontSize: 14,
              ),),
            ],
          )),
          floatingActionButton: RaisedButton(
            onPressed: () {},
            child: Text('Go to website'),
          ),
        );
      },
    );
  }
}
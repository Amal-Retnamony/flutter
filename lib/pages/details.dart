import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Details extends StatelessWidget {
  Map detailsData = {};
  Details({this.detailsData});
  void openUrl() async {
    if (await canLaunch(detailsData['url'])) {
      await launch(detailsData['url']);
    }
  }
  @override
  Widget build(BuildContext context) {
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
            child: Text(detailsData['title'], style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),),
          ),
          Image(image: NetworkImage(detailsData['urlToImage']),),
          SizedBox(height: 8),
          Text(detailsData['content'], style: TextStyle(
            fontSize: 14,
          ),),
        ],
      )),
      floatingActionButton: RaisedButton(
        onPressed: () {
          openUrl();
        },
        child: Text('Go to website'),
      ),
    );
  }
}
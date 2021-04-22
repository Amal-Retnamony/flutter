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
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: SingleChildScrollView(child: Column(
        children: [
          Image(image: NetworkImage(detailsData['urlToImage'])),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(detailsData['content'], style: TextStyle(
              fontSize: 14,
            ),),
          ),
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
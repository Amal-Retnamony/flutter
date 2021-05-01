import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(Icons.person, size: 200, color: Colors.grey,),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(8),
                  child: Text('Name', style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(32,8, 16, 8),
                  child: Text('User', style: TextStyle(
                    fontSize: 16,
                  )),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  child: Text('Email', style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(32,8, 16, 8),
                  child: Text('user@gmail.com', style: TextStyle(
                    fontSize: 16,
                  )),
                ),
              ],
            )
          )
        ],
      )
    );
  }
}

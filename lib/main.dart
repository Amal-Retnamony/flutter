import 'package:flutter/material.dart';
import 'pages/newsList.dart';
import 'pages/profile.dart';
import 'package:http/http.dart';
import 'dart:convert';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  void handleNavTap(int index) {
    this.setState(() {
      currentIndex = index;
    });
  }
  List<Widget> childrenList = [
    NewsList(),
    NewsList(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: childrenList[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: handleNavTap,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outlined),
            title: Text('Favorites'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile')
          )
        ],
      ),
    );
  }
}


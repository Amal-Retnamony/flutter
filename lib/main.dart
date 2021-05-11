import 'package:flutter/material.dart';
import 'package:newsletter/models/data.dart';
import 'package:newsletter/services/getData.dart';
import 'package:provider/provider.dart';
import 'pages/newsList.dart';
import 'pages/profile.dart';

void main() => runApp(
      ChangeNotifierProvider(
         create: (_) => Data(),
         child: MaterialApp(
           home: Home(),
  ),
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  bool isLoading = true;
  void handleNavTap(int index) {
    this.setState(() {
      currentIndex = index;
    });
  }
  @override
  void initState() {
    super.initState();
    var newsData = Provider.of<Data>(context, listen: false);
    GetData().getDataApi().then((value) {
      newsData.addList(value);
      this.setState(() {
        isLoading = false;
      });
    });
  }
  List<Widget> childrenList = [
    NewsList(false),
    NewsList(true),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading ?
             Center(child: CircularProgressIndicator(backgroundColor: Colors.grey, strokeWidth: 8.0,))
            : childrenList[currentIndex],
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


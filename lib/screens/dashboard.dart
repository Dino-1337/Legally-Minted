import 'package:flutter/material.dart';
import 'package:newsappflutter/generative_text_view.dart';
import 'package:newsappflutter/screens/news_page.dart';
import 'main_news.dart';
import 'search.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  final tabs =  [
    NewsList(), ChatView(), SearchScreen() 
    // , Search(), StarredHistory()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 3,
          unselectedItemColor: Colors.grey[700],
          selectedItemColor: Colors.red,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat), label: "Chat"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          ],
          onTap: (index) {
            print(_currentIndex);
            setState(() {
              _currentIndex = index;
            });
                        print(_currentIndex);

          },
        ));
  }
}
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NavigationRail Demo"),
      ),
      body: Row(
        children: [
          NavigationRail(
            groupAlignment: -1,
            backgroundColor: Colors.blue,
            selectedIconTheme: IconThemeData(color: Colors.white),
            selectedLabelTextStyle: TextStyle(color: Colors.white),
            unselectedIconTheme: IconThemeData(color: Colors.grey),
            unselectedLabelTextStyle: TextStyle(color: Colors.grey),
            onDestinationSelected: (newIndex) {
              setState(() {
                _selectedIndex = newIndex;
                _pageController.animateToPage(newIndex,
                    duration: Duration(milliseconds: 250),
                    curve: Curves.easeInOut);
              });
            },
            selectedIndex: _selectedIndex,
            labelType: NavigationRailLabelType.all,
            destinations: [
              NavigationRailDestination(
                  icon: Icon(Icons.home), label: Text("HOME")),
              NavigationRailDestination(
                  icon: Icon(Icons.phone), label: Text("Call")),
              NavigationRailDestination(
                  icon: Icon(Icons.help), label: Text("Info")),
            ],
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  child: Center(child: Text("HOME")),
                ),
                Container(
                  child: Center(child: Text("Call")),
                ),
                Container(
                  child: Center(child: Text("Info")),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

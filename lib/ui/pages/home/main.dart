import 'package:flutter/material.dart';
import 'package:oferi/ui/pages/home/homes_screen.dart';
import 'package:oferi/ui/pages/home/menu.dart';
import 'package:oferi/ui/pages/home/notification_page.dart';

import 'result.dart';
import 'profile_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  int _selectedIndex = 1;

  static const List<Widget> _widgetOptions = <Widget>[
    MenuPage(),
    HomeScreen(),
    NotificationPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          //brightness: Brightness.dark,
          primaryColor: Colors.green,
          inputDecorationTheme: const InputDecorationTheme(
              labelStyle: TextStyle(color: Colors.redAccent)),
        ),

        /*darkTheme:
            ThemeData(brightness: Brightness.dark, primaryColor: Colors.blue),*/
        home: bottomNavBar(context));
  }

  Widget bottomNavBar(BuildContext context) {
    return Scaffold(
        key: const Key('navBar'),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedLabelStyle: const TextStyle(color: Colors.black),
          unselectedItemColor: Colors.black,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "",
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:oferi/ui/pages/home_page/homes_screen.dart';
import 'package:oferi/ui/pages/home_page/menu.dart';
import 'package:oferi/ui/pages/home_page/notification_page.dart';

import 'result.dart';
import 'profile_page.dart';

class Content extends StatefulWidget {
  const Content({super.key});

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  int _selectedIndex = 0;

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
              label: 'Menu',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notificaciones',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ));
  }
}

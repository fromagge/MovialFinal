import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oferi/ui/pages/home/homes_screen.dart';
import 'package:oferi/ui/pages/home/menu_page.dart';
import 'package:oferi/ui/pages/home/notification_page.dart';
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
          inputDecorationTheme: const InputDecorationTheme(
              labelStyle: TextStyle(color: Colors.redAccent)),
        ),
        home: bottomNavBar(context));
  }

  Widget bottomNavBar(BuildContext context) {
    const double iconsize = 30;
    return Scaffold(
        key: const Key('navBar'),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: const Color(0xFF42006E),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.menu, size: iconsize),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled, size: iconsize),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, size: iconsize),
              label: "",
            ),
            BottomNavigationBarItem(
              icon:
                  Icon(CupertinoIcons.person_crop_circle, size: iconsize + 2.5),
              label: "",
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oferi/ui/pages/main/cart/cart_page.dart';
import 'package:oferi/ui/pages/main/home/home_page.dart';
import 'package:oferi/ui/pages/main/menu/menu_page.dart';
import 'package:oferi/ui/pages/main/user/profile_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  _NavBar createState() => _NavBar();
}

class _NavBar extends State<NavBar> {
  int _selectedIndex = 1;

  static const List<Widget> _widgetOptions = <Widget>[
    MenuPage(),
    HomePage(),
    CartPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const double iconsize = 30;
    return Scaffold(
      key: const Key('navBar'),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: bottomNavBar(context, iconsize),
    );
  }

  Widget bottomNavBar(BuildContext context, double iconsize) {
    return BottomNavigationBar(
        unselectedItemColor: const Color(0xFF42006E),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
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
            icon: Icon(CupertinoIcons.person_crop_circle, size: iconsize + 2.5),
            label: "",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped);
  }
}
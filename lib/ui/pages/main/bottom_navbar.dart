import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:oferi/ui/pages/main/cart/cart_page.dart';
import 'package:oferi/ui/pages/main/cart/checkout.dart';
import 'package:oferi/ui/pages/main/home/home_page.dart';
import 'package:oferi/ui/pages/main/menu/menu_page.dart';
import 'package:oferi/ui/pages/main/user/profile_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 1);
  }

  List<Widget> _buildScreens(BuildContext context) {
    return [Container(), const HomePage(), Container(), const ProfilePage()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    const double iconsize = 30;
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.menu, size: iconsize, color: Color(0xFF42006E)),
        onPressed: (value) {
          double height = MediaQuery.of(context).size.height;
          showMenuSheet(height, context);
        },
      ),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.home_filled,
              size: iconsize, color: Color(0xFF42006E))),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_cart,
            size: iconsize, color: Color(0xFF42006E)),
        onPressed: (value) {
          double height = MediaQuery.of(context).size.height;
          showCartSheet(height, context);
        },
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.person_crop_circle,
            size: iconsize + 2.5, color: Color(0xFF42006E)),
      ),
    ];
  }

  Future<dynamic> showMenuSheet(double height, BuildContext context) {
    return showMaterialModalBottomSheet(
      backgroundColor: Colors.transparent,
      elevation: 0.1,
      useRootNavigator: false,
      context: context,
      builder: (context) =>
          SizedBox(height: height * 0.35, child: const MenuPage()),
    );
  }

  Future<dynamic> showCartSheet(double height, BuildContext context) {
    return showMaterialModalBottomSheet(
      backgroundColor: Colors.transparent,
      elevation: 0.5,
      useRootNavigator: false,
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      builder: (context) => SizedBox(height: height * 0.78, child: CartPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(context),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: false,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style6, // Choose the nav bar style with this property.
      ),
    );
  }
}

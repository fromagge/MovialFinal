import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loggy/loggy.dart';
import 'package:oferi/ui/pages/main/menu/favorites_page.dart';
import 'package:oferi/ui/pages/main/menu/product_history_page.dart';
import 'package:oferi/ui/pages/main/menu/sell_product_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: menuIcon(
              "Vender",
              Icons.add_circle_rounded,
              Icons.add,
              context,
            ),
          ),
          Container(
              child: menuIcon(
            "Historial de Compra",
            CupertinoIcons.clock,
            CupertinoIcons.clock_solid,
            context,
          )),
          Container(
            child: menuIcon(
              "Mis Favoritos",
              CupertinoIcons.heart_circle_fill,
              CupertinoIcons.heart_circle,
              context,
            ),
          )
        ],
      ),
    );

    /*
    late GoogleMapController mapController;

    const LatLng _center = LatLng(45.521563, -122.677433);

    void _onMapCreated(GoogleMapController controller) {
      mapController = controller;
    }

    return Center(
      child: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: const CameraPosition(
            target: _center,
            zoom: 11.0,
          )),
    );
  }*/
  }

  Widget menuIcon(String label, IconData innerIcon, IconData outerIcon,
      BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        chooseMenuRoute(label, context);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 13),
        width: 400,
        height: 55,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Icon(
                  innerIcon,
                  color: Color(0xFFFF545F),
                  size: 50,
                ),
                Icon(
                  outerIcon,
                  color: Colors.white,
                  size: 50,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void chooseMenuRoute(String label, BuildContext context) {
    if (label.contains("Vender")) {
      logInfo("esto es venta");
      PersistentNavBarNavigator.pushNewScreen(
        context,
        screen: const SellProductPage(),
        pageTransitionAnimation: PageTransitionAnimation.fade,
      );
    } else {
      if (label.contains("Historial de Compra")) {
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: const ProductHistoryPage(),
          pageTransitionAnimation: PageTransitionAnimation.fade,
        );
      } else {
        if (label.contains("Mis Favoritos")) {
          logInfo("esto es favoritos");
          PersistentNavBarNavigator.pushNewScreen(
            context,
            screen: const FavoritesPage(),
            pageTransitionAnimation: PageTransitionAnimation.fade,
          );
        }
      }
    }
  }
}

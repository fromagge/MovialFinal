import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loggy/loggy.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: menuIcon("Vender", Icons.add_circle_rounded, Icons.add),
            ),
            Container(
                child: menuIcon(
              "Historial de Compra",
              CupertinoIcons.clock,
              CupertinoIcons.clock_solid,
            )),
            Container(
              child: menuIcon("Mis Favoritos", CupertinoIcons.heart_circle_fill,
                  CupertinoIcons.heart_circle),
            )
          ],
        ),
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

  Widget menuIcon(String label, IconData innerIcon, IconData outerIcon) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        if (label.contains("Vender")) {
          logInfo("esto es venta");
        } else {
          if (label.contains("Historial de Compra")) {
            logInfo("esto es historial");
          } else {
            if (label.contains("Mis Favoritos")) {
              logInfo("esto es favoritos");
            }
          }
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: 400,
        height: 45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Icon(
                  innerIcon,
                  color: Color(0xFFFF545F),
                  size: 40,
                ),
                Icon(
                  outerIcon,
                  color: Colors.white,
                  size: 40,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 7),
              child: Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

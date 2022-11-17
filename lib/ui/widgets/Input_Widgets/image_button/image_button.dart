import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oferi/ui/pages/main/home/result_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class ImageButton extends StatelessWidget {
  final String searchText;
  final String imgPath;
  final Color color;
  final double radius;
  const ImageButton(
      {super.key,
      required this.searchText,
      required this.imgPath,
      this.color = const Color(0xFF42006E),
      this.radius = 50});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(radius - 7),
            child: CircleAvatar(
              backgroundColor: color,
              radius: radius,
              child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Image(image: AssetImage(imgPath))),
            ),
            onTap: () {
              //Filtrar por categoria en controlador
              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: Result(
                  search: searchText,
                ),
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
          ),
          Text(
            searchText,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

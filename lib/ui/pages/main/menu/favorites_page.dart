import 'package:flutter/material.dart';
import 'package:oferi/ui/widgets/menu_widgets/title_widget.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          TitleWidget(
            title: "Mis Favoritos",
          )
        ],
      )),
    );
  }
}

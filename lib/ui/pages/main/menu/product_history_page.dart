import 'package:flutter/material.dart';
import 'package:oferi/ui/widgets/menu_widgets/title_widget.dart';

class ProductHistoryPage extends StatelessWidget {
  const ProductHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          TitleWidget(
            title: "Historial de compras",
          )
        ],
      )),
    );
  }
}

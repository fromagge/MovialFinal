import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:oferi/ui/widgets/Input_Widgets/button_widget.dart';
import 'package:oferi/ui/widgets/menu%20widgets/title_widget.dart';
import 'package:oferi/ui/widgets/product%20widgets/product_list_tile.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF3D9FA),
        body: SafeArea(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(15),
                children: [
                  const TitleWidget(
                    title: "Mi Carrito",
                    titleSize: 30,
                  ),
                  generateList(context),
                ],
              ),
              SizedBox(
                  width: 315,
                  child: DefaultButtonWidget(
                      edgeInset: EdgeInsets.only(bottom: 10),
                      label: "Ir a pagar",
                      onPressed: () {},
                      buttonColor: Color(0xFF42006E)))
            ],
          ),
        ));
  }

  Widget generateList(context) {
    return ListView.separated(
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 20,
      itemBuilder: (context, index) {
        return ProductListTile();
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 12);
      },
    );
  }
}

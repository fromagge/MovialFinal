import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:oferi/ui/widgets/product%20widgets/product_list_tile.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* return showMaterialModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        controller: ModalScrollController.of(context),
        child: Container(),
      ),dasdasasd
    );*/ // adadsasddasasdasd
    return Scaffold(
        backgroundColor: Color(0xFFF3D9FA),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(15),
            children: [
              title(context),
              generateList(context),
            ],
          ),
        ));
  }

  Widget generateList(context) {
    return ListView.separated(
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 100,
      separatorBuilder: (context, index) {
        return ProductListTile();
      },
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(height: 12);
      },
    );
  }
}

Widget title(BuildContext context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      IconButton(
        padding: const EdgeInsets.only(bottom: 5),
        icon: const Icon(CupertinoIcons.arrow_left_circle),
        iconSize: 40,
        color: const Color(0xFF42006E),
        onPressed: () {
          Get.back();
        },
      ),
      const Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        child: Text(
          "Mi Carrito",
          style: TextStyle(
            letterSpacing: 0.3,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(0xFF42006E),
          ),
        ),
      ),
    ],
  );
}

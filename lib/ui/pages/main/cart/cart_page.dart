import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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
        body: SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          title(context),
          generateList(),
        ],
      ),
    ));
  }

  Widget generateList() {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 10),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 100,
      itemBuilder: (context, index) {
        return const ListTile(
          title: Text("hola"),
        );
      },
    );
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
}

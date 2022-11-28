import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:oferi/domain/entities/purchase.dart';
import 'package:oferi/domain/entities/product.dart';
import 'package:oferi/ui/controllers/purchase_controller.dart';
import 'package:oferi/ui/widgets/image_widgets/image_widget.dart';
import 'package:oferi/ui/widgets/menu_widgets/title_widget.dart';
import 'package:intl/intl.dart';

class ProductHistoryPage extends StatefulWidget {
  const ProductHistoryPage({Key? key}) : super(key: key);

  @override
  State<ProductHistoryPage> createState() => _ProductHistoryPageState();
}

class _ProductHistoryPageState extends State<ProductHistoryPage> {
  late List<Purchase> purchases;
  late List<Purchase> lastWeekPurchases;
  late List<Purchase> lastMonthPurchases;
  late List<Purchase> lastSixMonthPurchases;
  late List<Purchase> yesterdayPurchases;
  late String currentDate;
  PurchaseController purchaseController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentDate = "";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            const TitleWidget(title: "Historial de compras"),
            FutureBuilder(
              future: purchaseController.getPurchaseList(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    EasyLoading.show();
                    return Container();
                  case ConnectionState.done:
                    EasyLoading.dismiss();
                    if (snapshot.hasData) {
                      List<Purchase> purchases = snapshot.data!;
                      EasyLoading.dismiss();
                      return purchaseHistory(purchases);
                    }
                    return Container();
                  default:
                    return Container();
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Widget purchaseHistory(List<Purchase> purchases) {
    return purchases.isEmpty
        ? Container(
            height: MediaQuery.of(context).size.height * 0.5,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 30),
            child: const Text(
              "No ha comprado ningun producto",
              style: TextStyle(color: Colors.black45, fontSize: 20),
            ))
        : SizedBox(
            child: CustomScrollView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: purchases.length,
                    (context, index) {
                      var date = DateFormat('dd-MM-yyyy')
                          .format(purchases[index].purchaseDate);

                      return Column(children: [
                        dateChanged(date)
                            ? Text(
                                "Comprado el $date",
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700),
                              )
                            : Container(),
                        purchaseTile(purchases[index])
                      ]);
                    },
                  ),
                ),
              ],
            ),
          );
  }

  Widget purchaseTile(Purchase purchase) {
    return FutureBuilder(
      future: purchaseController.getProductsInPurchase(purchase.id!),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            EasyLoading.show();
            return Container();

          case ConnectionState.done:
            if (snapshot.hasData) {
              List<Product> products = snapshot.data!;
              EasyLoading.dismiss();

              return products.isEmpty
                  ? Container()
                  : SizedBox(
                      child: CustomScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        slivers: [
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) =>
                                  productTile(purchase, products[index]),
                              childCount: products.length,
                            ),
                          ),
                        ],
                      ),
                    );
            }

            return Container();
          default:
            return Container();
        }
      },
    );
  }

  Widget productTile(Purchase purchase, Product product) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xFF42006E), width: 4),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                width: 140,
                height: 140,
                child: ImageWidget(imageUrl: product.imgs[0])),
            Container(
              margin: const EdgeInsets.only(left: 10, bottom: 10),
              child: SizedBox(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(
                        color: const Color(0xFF42006E).withOpacity(0.8),
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 3,
                    ),
                    RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: [
                          const TextSpan(
                              text: 'Dirección: ',
                              style: TextStyle(fontWeight: FontWeight.w600)),
                          TextSpan(text: purchase.address),
                          const TextSpan(text: '\n'),
                          const TextSpan(
                              text: 'Vendedor: ',
                              style: TextStyle(fontWeight: FontWeight.w600)),
                          TextSpan(text: product.seller),
                          const TextSpan(text: '\n'),
                          const TextSpan(
                              text: 'Fecha de compra: ',
                              style: TextStyle(fontWeight: FontWeight.w600)),
                          TextSpan(
                              text: DateFormat('dd/MM/yyyy')
                                  .format(purchase.purchaseDate)),
                          const TextSpan(text: '\n'),
                          const TextSpan(
                              text: 'Método de pago: ',
                              style: TextStyle(fontWeight: FontWeight.w600)),
                          TextSpan(
                              text:
                                  " ${purchase.paymentMethod.split(".").last.replaceAll("_", " ")}"),
                          const TextSpan(text: '\n'),
                          const TextSpan(
                              text: 'Pago: ',
                              style: TextStyle(fontWeight: FontWeight.w600)),
                          TextSpan(text: "\$ ${product.price}"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  bool dateChanged(String newDate) {
    if (currentDate.isEmpty) {
      currentDate = newDate;
      return true;
    }
    if (currentDate != newDate) {
      currentDate = newDate;
      return true;
    }

    return false;
  }
}

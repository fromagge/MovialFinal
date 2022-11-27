import 'package:flutter/material.dart';
import 'package:oferi/domain/entities/purchase.dart';
import 'package:oferi/domain/entities/product.dart';
import 'package:oferi/ui/pages/main/cart/checkout.dart';
import 'package:oferi/ui/widgets/image_widgets/image_widget.dart';
import 'package:oferi/ui/widgets/menu_widgets/title_widget.dart';
import 'package:oferi/ui/widgets/product_widgets/product_grid_card.dart';
import 'package:intl/intl.dart';

class ProductHistoryPage extends StatefulWidget {
  const ProductHistoryPage({Key? key}) : super(key: key);

  @override
  State<ProductHistoryPage> createState() => _ProductHistoryPageState();
}

class _ProductHistoryPageState extends State<ProductHistoryPage> {
  late List<Purchase> todayPurchases;
  late List<Purchase> lastWeekPurchases;
  late List<Purchase> lastMonthPurchases;
  late List<Purchase> lastSixMonthPurchases;
  late List<Purchase> yesterdayPurchases;

  @override
  void initState() {
    // TODO: implement initState

    todayPurchases = [];
    yesterdayPurchases = [];
    lastWeekPurchases = [];
    lastMonthPurchases = [];
    lastSixMonthPurchases = [];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            const TitleWidget(title: "Historial de compras"),
            purchaseHistory(todayPurchases, "Comprado Hoy:"),
            purchaseHistory(yesterdayPurchases, "Ayer"),
            purchaseHistory(lastWeekPurchases, "Última semana"),
            purchaseHistory(lastMonthPurchases, "Último mes"),
            purchaseHistory(lastSixMonthPurchases, "Últimos seis meses"),
          ],
        ),
      ),
    );
  }

  Widget purchaseHistory(List<Purchase> purchases, String title) {
    return purchases.isEmpty
        ? Container()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: Text(
                  title,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      color: Colors.red,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  child: CustomScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => purchaseTile(purchases[index]),
                          childCount: purchases.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
  }

  Widget purchaseTile(Purchase purchase) {
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
                child: ImageWidget(imageUrl: purchase.imgUrl)),
            Container(
              margin: const EdgeInsets.only(left: 10, bottom: 10),
              child: SizedBox(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      purchase.name,
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
                          TextSpan(text: purchase.seller),
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
                          TextSpan(text: " ${purchase.paymentMethod}"),
                          const TextSpan(text: '\n'),
                          const TextSpan(
                              text: 'Pago: ',
                              style: TextStyle(fontWeight: FontWeight.w600)),
                          TextSpan(text: "\$ ${purchase.price!.toInt()}"),
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
}

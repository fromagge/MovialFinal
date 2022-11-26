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
  final one = Purchase(
      category: "categoria",
      imgUrl:
          "https://cdn.shopify.com/s/files/1/0070/7032/files/image5_4578a9e6-2eff-4a5a-8d8c-9292252ec848.jpg?v=1620247043",
      latitude: 50.toDouble(),
      longitude: 20.toDouble(),
      name: "Nombre del producto",
      seller: "Vendedor con un nombre pero muy muy muy largo",
      price: 20000.toDouble(),
      paymentMethod: "Tarjeta de credito",
      purchaseDate: DateTime.now(),
      deliveredDate: DateTime.now());
  @override
  void initState() {
    // TODO: implement initState

    todayPurchases = [
      one,
      one,
      one,
      one,
      one,
      one,
      one,
      one,
      one,
      one,
      one,
      one,
      one
    ];
    yesterdayPurchases = [];
    lastWeekPurchases = [];
    lastMonthPurchases = [one, one, one, one, one, one];
    lastSixMonthPurchases = [one];
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
                    Text('Vendedor: ${purchase.seller}'),
                    const SizedBox(height: 5),
                    Text(
                        'Fecha de compra: ${DateFormat('yyyy-MM-dd').format(purchase.purchaseDate)}'),
                    const SizedBox(height: 3),
                    Text("Pago por ${purchase.paymentMethod.toLowerCase()}"),
                    const SizedBox(height: 3),
                    Text("\$ ${purchase.price!.toInt()}"),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

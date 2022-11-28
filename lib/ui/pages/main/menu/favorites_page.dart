import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:oferi/domain/entities/product.dart';
import 'package:oferi/ui/controllers/cart_controller.dart';
import 'package:oferi/ui/controllers/favorite_controller.dart';
import 'package:oferi/ui/pages/main/home/product_detailed_page.dart';
import 'package:oferi/ui/widgets/Input_Widgets/button_widget.dart';
import 'package:oferi/ui/widgets/image_widgets/image_widget.dart';
import 'package:oferi/ui/widgets/menu_widgets/title_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  FavoriteController favoriteController = Get.find();
  CartController cartController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            const TitleWidget(title: "Mis Favoritos"),
            favoritesList()
          ],
        ),
      ),
    );
  }

  Widget favoritesList() {
    return FutureBuilder(
      future: favoriteController.getProductsInFavoriteList(),
      builder: (context, snapshot) {
        logInfo(snapshot.connectionState);
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            if (snapshot.hasData) {
              List<Product> favorites = snapshot.data!;
              logInfo("favoritos son $favorites");
              return favorites.isEmpty
                  ? const Center(
                      child: Text(
                      "No tienes ningun favorito actualmente",
                      style: TextStyle(fontSize: 17, color: Colors.black54),
                    ))
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 400,
                          child: CustomScrollView(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            slivers: [
                              SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  (context, index) => Container(
                                    margin: const EdgeInsets.only(bottom: 20),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Color(
                                                (math.Random().nextDouble() *
                                                        0xFFFFFF)
                                                    .toInt())
                                            .withOpacity(0.25)),
                                    child: favoriteTile(favorites[index]),
                                  ),
                                  childCount: favorites.length,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
            }

            return Center(child: Text("Error al buscar favoritos"));
          default:
            return Container(
                alignment: Alignment.center,
                width: 90,
                height: 90,
                child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget favoriteTile(Product favorite) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: ProductDetailedPage(
            product: favorite,
          ),
          pageTransitionAnimation: PageTransitionAnimation.fade,
        );
      },
      child: Container(
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
                child: ImageWidget(imageUrl: favorite.imgs[0])),
            Container(
              margin: const EdgeInsets.only(left: 10, bottom: 10),
              child: SizedBox(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      favorite.name,
                      style: TextStyle(
                        color: const Color(0xFF42006E).withOpacity(0.8),
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      "Precio: \$ ${favorite.price.toInt()}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      child: DefaultButtonWidget(
                          label: "Agregar al carrito",
                          onPressed: () {
                            EasyLoading.showSuccess(
                                "${favorite.name} añadido al carrito");
                            cartController.addProducToCart(favorite.id);
                          },
                          buttonColor: const Color(0xFF42006E)),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

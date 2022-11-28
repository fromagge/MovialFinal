import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:oferi/domain/entities/product.dart';
import 'package:oferi/domain/entities/user.dart';
import 'package:oferi/ui/controllers/authentication_controller.dart';
import 'package:oferi/ui/controllers/product_controller.dart';
import 'package:oferi/ui/controllers/user_controller.dart';
import 'package:oferi/ui/pages/login/login_page.dart';
import 'package:oferi/ui/pages/main/home/product_detailed_page.dart';
import 'package:oferi/ui/pages/main/user/profile_edit_page.dart';
import 'package:oferi/ui/widgets/Input_Widgets/button_widget.dart';
import 'package:oferi/ui/widgets/menu_widgets/title_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../widgets/image_widgets/image_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AuthenticationController authController = Get.find();
  UserController userController = Get.find();
  ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const TitleWidget(
            title: "Mi perfil",
            withBackArrow: false,
          ),
          userWidget(context),
          DefaultButtonWidget(
            label: "Editar perfil",
            onPressed: () {
              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: const ProfileEditPage(),
                pageTransitionAnimation: PageTransitionAnimation.fade,
              );
              //Edit page
            },
            textColor: const Color(0xFF42006E),
            buttonColor: const Color(0xFFF3D9FA),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(left: 5),
            alignment: Alignment.centerLeft,
            child: const Text(
              "Productos en venta:",
              style: TextStyle(color: Colors.black54, fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          sellingList(
            [],
            context,
          ),
          const SizedBox(
            height: 20,
          ),
          DefaultButtonWidget(
            onPressed: () {
              authController.logout();
              Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => const LoginPage()),
                  (Route<dynamic> route) => false);
            },
            label: "Log Out",
            buttonColor: const Color(0xFF42006E),
          ),
        ]),
      )),
    );
  }

  Widget userWidget(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(
            CupertinoIcons.person_crop_circle,
            color: Color(0xFF42006E),
            size: 110,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            margin: const EdgeInsets.only(left: 10),
            child: FutureBuilder(
                future: userController.getCurrentUser(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.done:
                      AppUser user = snapshot.data!;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${user.names.capitalizeFirst} ${user.surnames.capitalizeFirst} ",
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                color: Color(0xFF42006E),
                                fontSize: 28,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            user.country,
                            style: TextStyle(
                                color: const Color(0xFF42006E).withOpacity(0.7),
                                fontSize: 25),
                          ),
                        ],
                      );
                    default:
                      return Text("Cargando");
                  }
                }),
          )
        ],
      ),
    );
  }

  Widget sellingList(List sellingProducts, BuildContext context) {
    return sellingProducts.isNotEmpty
        ? SizedBox(
            height: MediaQuery.of(context).size.height * 0.37,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sellingProducts.length,
              itemBuilder: (context, index) {
                return SizedBox(
                    width: 190, child: productCard(sellingProducts[index]));
              },
            ),
          )
        : Container(
            height: MediaQuery.of(context).size.height * 0.37,
            alignment: Alignment.center,
            child: const Text("No tienes productos en venta actualmente"),
          );
  }

  Widget productCard(Product product) {
    return InkWell(
      onTap: () {
        //Cuando el producto es seleccionado, ir a detalles.
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: ProductDetailedPage(product: product),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 2, color: const Color(0xFFE4E0E0))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                        alignment: Alignment.center,
                        child: ImageWidget(imageUrl: product.imgs[0])),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                product.name,
                style: const TextStyle(fontSize: 18),
                maxLines: 3,
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: constraints.minWidth,
                          ),
                          child: Text(
                            "\$ ${product.price.toStringAsFixed(2)}",
                            maxLines: 3,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              )
            ],
          )),
    );
  }
}

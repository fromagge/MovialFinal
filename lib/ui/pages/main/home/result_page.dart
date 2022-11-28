import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loggy/loggy.dart';
import 'package:oferi/domain/entities/product.dart';
import 'package:oferi/ui/pages/main/bottom_navbar.dart';
import 'package:oferi/ui/pages/main/home/home_page.dart';
import 'package:oferi/ui/widgets/input_widgets/category_button/category_list_widget.dart';
import 'package:oferi/ui/widgets/product_widgets/product_grid_card.dart';
import 'package:oferi/ui/widgets/product_widgets/product_grid.dart';
import 'package:oferi/ui/widgets/input_widgets/search_bar.dart';
import 'package:oferi/ui/widgets/input_widgets/category_button/category_button_widget.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class Result extends StatelessWidget {
  Result({Key? key, required this.search}) : super(key: key);
  final String search;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: DefaultTabController(
        length: 1,
        child: SafeArea(
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: NestedScrollView(
                floatHeaderSlivers: true,
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  logInfo("this is $search");
                  return [
                    SliverAppBar(
                      floating: true,
                      pinned: true,
                      toolbarHeight: 90,
                      leadingWidth: 40,
                      leading: IconButton(
                        icon: const Icon(
                          CupertinoIcons.arrow_left_circle,
                          size: 45,
                        ),
                        iconSize: 50,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      title: SearchBar(
                        searchText: search,
                        placeholder: search,
                        onSubmitted: (searchText) {
                          logInfo("Buscando de nuevo: $searchText");
                        },
                      ),
                      backgroundColor: const Color(0xFF42006E),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate.fixed(
                        [
                          Container(
                            color: Colors.black.withOpacity(0.9),
                            child: CategoryList(),
                          )
                        ],
                      ),
                    ),
                  ];
                },
                body: ProductGrid()),
          ),
        ),
      ),
    );
  }
}

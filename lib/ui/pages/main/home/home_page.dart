import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';
import 'package:oferi/ui/pages/main/bottom_navbar.dart';
import 'package:oferi/ui/pages/main/home/result_page.dart';
import 'package:oferi/ui/widgets/input_widgets/image_button/image_button_grid.dart';
import 'package:oferi/ui/widgets/input_widgets/search_bar.dart';
import 'package:division/division.dart';
import 'package:oferi/ui/widgets/location_select_widget.dart';
import 'package:oferi/ui/widgets/carrousel.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: (() => FocusScope.of(context).requestFocus(FocusNode())),
      child: Scaffold(
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  toolbarHeight: height / 24,
                  backgroundColor: Color(0xFF42006E),
                ),
              ];
            },
            body: Center(
                child: ListView(
              children: [
                LocationSelectWidget(),
                SearchBar(
                  clear: true,
                  onSubmitted: (searchText) {
                    logInfo("Buscando: $searchText");
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: Result(
                        search: searchText,
                      ),
                      pageTransitionAnimation: PageTransitionAnimation.fade,
                    );
                  },
                ),
                ImageButtonGrid(),
                const Carousel(aspectRatio: 2),
              ],
            )),
          ),
        ),
      ),
    );
  }
}

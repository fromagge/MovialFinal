import 'package:flutter/material.dart';
import 'package:oferi/ui/widgets/Input_Widgets/image_button/image_button_grid.dart';
import 'package:oferi/ui/widgets/Input_Widgets/search_bar.dart';
import 'package:division/division.dart';
import 'package:oferi/ui/widgets/location_select_widget.dart';
import 'package:oferi/ui/widgets/carrousel.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              const SliverAppBar(
                automaticallyImplyLeading: false,
                toolbarHeight: 50,
                backgroundColor: Color(0xFF42006E),
              ),
            ];
          },
          body: Center(
              child: ListView(
            children: [
              LocationSelectWidget(),
              SearchBar(),
              ImageButtonGrid(),
              Carousel(aspectRatio: 2),
            ],
          )),
        ),
      ),
    );
  }
}

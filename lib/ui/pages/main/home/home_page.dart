import 'package:flutter/material.dart';
import 'package:oferi/ui/widgets/input_widgets/image_button/image_button_grid.dart';
import 'package:oferi/ui/widgets/input_widgets/search_bar.dart';
import 'package:division/division.dart';
import 'package:oferi/ui/widgets/location_select_widget.dart';
import 'package:oferi/ui/widgets/carrousel.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
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

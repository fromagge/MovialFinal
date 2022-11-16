import 'package:carousel_slider/carousel_slider.dart';
import 'package:division/division.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

const imgDefault = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class Carousel extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final List<String> images;

  const Carousel({super.key, List<String>? images})
      : images = images ?? imgDefault;

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _currentIndex = 0;
  CarouselController controller = CarouselController();
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: controller,
          items: imgDefault.map((image) {
            return Parent(
                style: ParentStyle(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                    height: 400,
                  ),
                ));
          }).toList(),
          options: CarouselOptions(
              autoPlay: false,
              aspectRatio: 1.50,
              initialPage: _currentIndex,
              enlargeCenterPage: true,
              disableCenter: true,
              onPageChanged: (val, _) {
                setState(() {
                  _currentIndex = val;
                  controller.jumpToPage(val);
                });
              }),
        ),
        DotsIndicator(
          decorator: DotsDecorator(activeColor: Colors.black.withOpacity(0.6)),
          dotsCount: imgDefault.length,
          position: _currentIndex.toDouble(),
        )
      ],
    );
  }
}

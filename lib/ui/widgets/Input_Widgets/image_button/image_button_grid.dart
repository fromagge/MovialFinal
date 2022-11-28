import 'package:flutter/material.dart';
import 'package:oferi/ui/widgets/Input_Widgets/image_button/image_button.dart';

class ImageButtonGrid extends StatelessWidget {
  ImageButtonGrid({super.key});

  static List<String> categorias = [
    "Moda",
    "Tecnología",
    "Juguetes",
    "Hogar",
    "Herramientas",
    "Otros"
  ];

  List<String> imgPaths = [
    "assets/images/icons/moda.png",
    "assets/images/icons/tecnologia.png",
    "assets/images/icons/juguetes.png",
    "assets/images/icons/hogar.png",
    "assets/images/icons/herramientas.png",
    "assets/images/icons/otros.png"
  ];

  List<Color> colors = [
    const Color(0xFFF3D9FA),
    const Color(0xFFFAF2C8),
    const Color(0xFFD2EDF6)
  ];

  List<Image> images = [];
  final _nrOfButtons = 6;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 13.0, right: 13.0, top: 15.0),
        child: SizedBox(
            height: 300,
            child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 15,
                childAspectRatio: 0.9,
                mainAxisSpacing: 9,
                children: imageList())));
  }

  List<Widget> imageList() {
    return List.generate(_nrOfButtons, (index) {
      return ImageButton(
        searchText: categorias[index],
        imgPath: imgPaths[index],
        color: colors[index % 3],
      );
    }, growable: false);
    //);
  }
}

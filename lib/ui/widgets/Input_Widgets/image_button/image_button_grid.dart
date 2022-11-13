import 'package:flutter/material.dart';
import 'package:oferi/ui/widgets/Input_Widgets/image_button/image_button.dart';

class ImageButtonGrid extends StatelessWidget {
  const ImageButtonGrid({super.key});
  static const categorias = [
    "Moda",
    "Tecnología",
    "Juguetes",
    "Hogar",
    "Herramientas",
    "Otros"
  ];
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
                children: ImageList())));
  }

  List<Widget> ImageList() {
    return List.generate(
        _nrOfButtons, (index) => ImageButton(text: categorias[index]));
    //);
  }
}

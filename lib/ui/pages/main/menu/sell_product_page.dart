// ignore_for_file: unused_import, use_key_in_widget_constructors, unused_local_variable, prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use, sized_box_for_whitespace, avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loggy/loggy.dart';
import 'package:oferi/ui/utils/validator.dart';
import 'package:oferi/ui/widgets/Input_Widgets/button_widget.dart';
import 'package:oferi/ui/widgets/Input_Widgets/textfield_widget.dart';
import 'package:oferi/ui/widgets/menu_widgets/title_widget.dart';

class SellProduct extends StatefulWidget {
  @override
  _SellProduct createState() => _SellProduct();
}

class _SellProduct extends State<SellProduct> {
  XFile? image;
  var position;

  final ImagePicker picker = ImagePicker();

  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controllers = List.generate(4, (_) => TextEditingController());
  }

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  Future getPosition() async {
    var request = await Geolocator.checkPermission();
    var pos = await Geolocator.getCurrentPosition();
    setState(() {
      position = pos;
    });
  }

  @override
  Widget build(BuildContext context) {
    double dividerHeight = 15;
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.topCenter,
          child: ListView(
            children: [
              TitleWidget(
                title: "Vender producto",
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          myAlert();
                        },
                        child: Text('Subir foto'),
                      ),
                    ),
                    SizedBox(
                      height: dividerHeight,
                    ),
                    //if image not null show the image
                    //if image null show text
                    image != null
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.file(
                                //to show image, you type like this.
                                File(image!.path),
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                                height: 300,
                              ),
                            ),
                          )
                        : Center(
                            child: Text(
                              "No Image",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                    Container(
                      height: 20,
                    ),
                    Form(
                      key: _key,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(children: [
                        DefaultTextWidget(
                          label: "Nombre del producto",
                          controller: controllers[0],
                          validator: (value) =>
                              Validator.validateText(value ?? ""),
                        ),
                        Container(
                          height: dividerHeight,
                        ),
                        DefaultTextWidget(
                          label: "Categoria del producto",
                          controller: controllers[1],
                          validator: (value) =>
                              Validator.validateText(value ?? ""),
                        ),
                        Container(
                          height: dividerHeight,
                        ),
                        DefaultTextWidget(
                          label: "Precio del producto",
                          controller: controllers[2],
                          validator: (value) =>
                              Validator.validateText(value ?? ""),
                        ),
                        Container(
                          height: dividerHeight,
                        ),
                        DefaultTextWidget(
                          label: "Descripción del producto",
                          maxLines: 5,
                          controller: controllers[3],
                          validator: (value) =>
                              Validator.validateText(value ?? ""),
                        ),
                        Container(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 105),
                          child: DefaultButtonWidget(
                              label: "Ubicación automática",
                              textColor: Color(0xFF42006E),
                              onPressed: () async {
                                getPosition();
                                logInfo(position);
                              },
                              buttonColor: Color(0xFFFAF2C8)),
                        ),
                        Container(
                          height: dividerHeight,
                        ),
                        Text(
                          " ${position != null ? "Latitud: ${position.latitude} & Longitud: ${position.longitude}" : "Sin ubicación"}",
                          style: TextStyle(fontSize: 17),
                        ),
                        Container(
                          height: dividerHeight,
                        ),
                        DefaultButtonWidget(
                            label: "Publicar",
                            onPressed: () {
                              var productName = controllers[0].text;
                              var productCategory = controllers[1].text;
                              var productPrice = controllers[2].text;
                              var productDescription = controllers[3].text;
                              final form = _key.currentState;
                              form!.save();
                              if (form.validate()) {
                                if (image == null || position == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "Recuerde agregar la imagen y su ubicación")));
                                } else {
                                  //productController.createProduct(image, productName,productCategory,productPrice,productDescription,position.latitude,position.longitude)
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "Producto agregado satisfactoriamente")));
                                }
                              }

                              //TODO: productController.createProduct()
                            },
                            buttonColor: Color(0xFF42006E))
                      ]),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('  From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('  From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

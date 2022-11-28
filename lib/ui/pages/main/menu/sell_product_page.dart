// ignore_for_file: unused_import, use_key_in_widget_constructors, unused_local_variable, prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use, sized_box_for_whitespace, avoid_print

import 'dart:io';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loggy/loggy.dart';
import 'package:oferi/domain/entities/product.dart';
import 'package:oferi/ui/controllers/authentication_controller.dart';
import 'package:oferi/ui/controllers/product_controller.dart';
import 'package:oferi/ui/utils/validator.dart';
import 'package:oferi/ui/widgets/Input_Widgets/button_widget.dart';
import 'package:oferi/ui/widgets/Input_Widgets/textfield_widget.dart';
import 'package:oferi/ui/widgets/menu_widgets/title_widget.dart';

class SellProduct extends StatefulWidget {
  @override
  _SellProduct createState() => _SellProduct();
}

class _SellProduct extends State<SellProduct> {
  late List<File> images;
  var position;

  final ImagePicker picker = ImagePicker();

  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;
  CarouselController controller = CarouselController();
  double _currentIndex = 0;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  ProductController productController = Get.find();

  @override
  void initState() {
    super.initState();
    controllers = List.generate(4, (_) => TextEditingController());
    images = [];
  }

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    XFile? img = await picker.pickImage(source: media);

    setState(() {
      img != null ? images.add(File(img.path)) : null;
    });
  }

  Future getPosition() async {
    var request = await Geolocator.requestPermission();
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
                          if (images.length < 6) {
                            myAlert();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    "Maximo número de imagenes alcanzado")));
                          }
                        },
                        child: Text('Subir foto'),
                      ),
                    ),
                    SizedBox(
                      height: dividerHeight,
                    ),
                    //if image not null show the image
                    //if image null show text
                    images.isNotEmpty
                        ? showCarrousel()
                        : Center(
                            child: Text(
                              "No Images",
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
                              String productName = controllers[0].text;
                              String productCategory = controllers[1].text;
                              double productPrice =
                                  double.parse(controllers[2].text);
                              String productDescription = controllers[3].text;
                              final form = _key.currentState;
                              form!.save();
                              if (form.validate()) {
                                if (images.isEmpty || position == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "Recuerde agregar la imagen y su ubicación")));
                                } else {
                                  Product product = Product(
                                      name: productName,
                                      category: productCategory,
                                      imgs: [],
                                      longitude: position.longitude,
                                      description: productDescription,
                                      price: productPrice,
                                      latitude: position.latitude);
                                  productController.publishProduct(
                                      product, images);
                                  //productController.createProduct(image, productName,productCategory,productPrice,productDescription,position.latitude,position.longitude)
                                  EasyLoading.showSuccess(
                                      "Producto agregado satisfactoriamente - Este proceso puede tardar unos segundos");
                                  // Navigator.of(context).pop();
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

  Widget showCarrousel() {
    logInfo("Imagenes son $images");
    return ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: images.length != 1
                  ? CarouselSlider(
                      carouselController: controller,
                      items: images.map((image) {
                        return showImage(image);
                      }).toList(),
                      options: CarouselOptions(
                          padEnds: false,
                          pageSnapping: false,
                          scrollPhysics: const BouncingScrollPhysics(),
                          autoPlay: false,
                          enableInfiniteScroll: false,
                          aspectRatio: 1.2,
                          initialPage: _currentIndex.toInt(),
                          enlargeCenterPage: true,
                          disableCenter: true,
                          onPageChanged: (val, _) {
                            setState(() {
                              _currentIndex = val.toDouble();
                            });
                          }),
                    )
                  : Container(
                      alignment: Alignment.center,
                      height: 300,
                      width: 300,
                      child: showImage(images[0]),
                    ),
            ),
            DotsIndicator(
                decorator:
                    DotsDecorator(activeColor: Colors.black.withOpacity(0.6)),
                dotsCount: images.length,
                position: _currentIndex > 0 ? _currentIndex : 0.0)
          ],
        ));
  }

  Widget showImage(File image) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            height: 600,
            child: Image.file(
              //to show image, you type like this.
              File(image.path),
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ),
        Container(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () {
              setState(() {
                images.remove(image);
                _currentIndex = _currentIndex - 1;
              });
            },
            icon: Icon(Icons.delete_sharp),
            iconSize: 40,
            color: Color(0xFF42006E).withOpacity(0.8),
          ),
        )
      ],
    );
  }
}

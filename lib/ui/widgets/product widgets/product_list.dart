import 'dart:convert';

import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:oferi/domain/entities/drink.dart';
import 'package:oferi/ui/pages/loading/loader_widget.dart';
import 'package:oferi/ui/widgets/product%20widgets/product_card.dart';

Future fetchResource() async {
  final response = await http.get(
      Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/search.php?s=s'));

  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load album');
  }
}

class ListProduct extends StatefulWidget {
  const ListProduct({Key? key}) : super(key: key);

  @override
  State<ListProduct> createState() => _ListProduct();
}

class _ListProduct extends State<ListProduct> {
  _ListProduct();

  late Future futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchResource();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureData,
      builder: (futureData, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            EasyLoading.show();
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData) {
              EasyLoading.dismiss();

              var data = json.decode(snapshot.data)["drinks"];
              data = data.map<Drink>((json) => Drink.fromJson(json)).toList();
              return HorizList(data: data);
            }
            break;
          default:
            return const Txt("Fatal error");
        }
        return const LoaderWidget();
      },
    );
  }
}

class HorizList extends StatelessWidget {
  const HorizList({super.key, required this.data});

  final double size = 121;
  final int columns = 2;
  final List data;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 13.0, right: 13.0, top: 10.0),
        child: SizedBox(
            height: 800,
            child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: columns,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                crossAxisSpacing: 15,
                childAspectRatio: 0.9,
                mainAxisSpacing: 9,
                children: data.map((e) => ProductCard(drink: e)).toList())));
  }
}

import 'dart:convert';
import 'dart:ffi';

import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:oferi/domain/entities/drink.dart';
import 'package:oferi/ui/pages/loading/index.dart';
import 'package:oferi/ui/widgets/item_card.dart';

Future fetchResource() async {
  final response = await http.get(Uri.parse(
      'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Martini'));

  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load album');
  }
}

class ListItem extends StatefulWidget {
  const ListItem({super.key, direction});
  final Axis direction = Axis.horizontal;
  @override
  State<ListItem> createState() => _ListItem(direction);
}

class _ListItem extends State<ListItem> {
  _ListItem(this.direction);

  late Future futureData;
  final Axis direction;

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
                return HorizList(data: data, direction: direction);
              }
              break;
            default:
              return const Txt("Fatal error");
          }
          return const LoaderPage();
        });
  }
}

class HorizList extends StatelessWidget {
  const HorizList({super.key, required this.data, required this.direction});

  final double size = 121;
  final int rows = 3;
  final List data;
  final Axis direction;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 13.0, right: 13.0, top: 10.0),
        child: SizedBox(
            height: size * rows,
            child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: rows,
                physics: const ClampingScrollPhysics(),
                scrollDirection: direction,
                crossAxisSpacing: 10,
                mainAxisSpacing: 9,
                children: data.map((e) => ItemCard(drink: e)).toList())));
  }
}

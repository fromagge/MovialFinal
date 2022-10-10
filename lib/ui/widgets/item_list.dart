import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future fetchResource() async {
  final response = await http.get(
      Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/search.php?s='));

  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load album');
  }
}

class ListItem extends StatefulWidget {
  const ListItem({super.key});
  @override
  State<ListItem> createState() => _ListItem();
}

class _ListItem extends State<ListItem> {
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
          if (snapshot.hasData) {
            return Text(snapshot.data);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_countries_world_map_demo/world_map_page.dart';
import 'country_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'World map Example',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: const CountryPage(country: "us"));
  //  home:  WorldMapPage());
  }
}



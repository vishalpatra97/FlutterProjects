import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import './widgets/poke-screen-widget.dart';
import './models/pokehub.dart';

// import 'package:http/http.dart' as http;
void main() {
  runApp(const PokeApp());
}

class PokeApp extends StatefulWidget {
  const PokeApp({Key? key}) : super(key: key);
  @override
  State<PokeApp> createState() => _PokeAppState();
}

class _PokeAppState extends State<PokeApp> {
  final url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  late PokeHub pokeHub;

  // void fetchData() async {
  //   final response = await get(Uri.parse(url));
  //   final jsonData = jsonDecode(response.body); //decode JSON
  //   pokeHub = PokeHub.fromJson(jsonData);
  //   setState(() {});
  // }

  void fetchData() async {
    final response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      pokeHub = PokeHub.fromJson(jsonData);
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Poke App",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Poke App"),
          backgroundColor: Colors.cyan,
        ),
        // drawer: const Drawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.cyan,
          child: const Icon(Icons.refresh),
        ),
        body: pokeHub == null
            ? Center(child: CircularProgressIndicator())
            : GridView.count(
                crossAxisCount: 2,
                children: pokeHub.pokemon!
                    .map((poke) => Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: PokeScreenWidget(poke),
                        ))
                    .toList(),
              ),
      ),
    );
  }
}

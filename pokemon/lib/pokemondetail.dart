import 'package:flutter/material.dart';
import './models/pokehub.dart';

class PokeDetail extends StatelessWidget {
  final Pokemon pokemon;

  PokeDetail({required this.pokemon});

  bodyWidget(BuildContext context) => Stack(
        children: [
          Positioned(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width - 20,
            left: 10.0,
            top: MediaQuery.of(context).size.height * 0.1,
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 50.0,
                    ),
                    Text(
                      pokemon.name.toString(),
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                    Text("Height: ${pokemon.height}"),
                    Text("Weight: ${pokemon.weight}"),
                    Text(
                      "Types",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: pokemon.type!
                          .map((t) => FilterChip(
                              backgroundColor: Colors.amber,
                              label: Text(t),
                              onSelected: (b) {}))
                          .toList(),
                    ),
                    Text(
                      "Weakness",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: pokemon.weaknesses!
                          .map((t) => FilterChip(
                              backgroundColor: Colors.red,
                              label: Text(
                                t,
                                style: TextStyle(color: Colors.white),
                              ),
                              onSelected: (b) {}))
                          .toList(),
                    ),
                    Text(
                      "Next Evolution",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: pokemon.nextEvolution!
                          .map((n) => FilterChip(
                              backgroundColor: Colors.green,
                              label: Text(
                                n.name.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                              onSelected: (b) {}))
                          .toList(),
                    ),
                  ],
                )),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
                tag: pokemon.img.toString(),
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(pokemon.img.toString()))),
                )),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(pokemon.name.toString()),
        elevation: 0.0,
      ),
      body: bodyWidget(context),
    );
  }
}

import 'package:flutter/material.dart';

import '../models/pokehub.dart';
import '../pokemondetail.dart';

class PokeScreenWidget extends StatelessWidget {
  late Pokemon poke2;

  PokeScreenWidget(this.poke2);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => PokeDetail(
              pokemon: poke2,
            ),
          ),
        );
      },
      child: Hero(
        tag: poke2.img.toString(),
        child: Card(
          elevation: 3.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(poke2.img.toString()))),
              ),
              Text(
                poke2.name.toString(),
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

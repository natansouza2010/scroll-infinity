import 'package:flutter/material.dart';
import 'package:scrollinfinity/feature/pokemon/infra/model/pokemon_model.dart';

class ImagePokemon extends StatelessWidget {
  final PokemonModel? pokemon;
  const ImagePokemon({super.key, this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: "Eita",
        child: Center(
          child: Image.network(pokemon?.image ?? "", width: 520),
        ));
  }
}

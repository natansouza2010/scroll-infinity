import 'package:flutter/material.dart';
import 'package:scrollinfinity/feature/pokemon/presenter/pages/components/details_pokemon.dart';
import 'package:scrollinfinity/feature/pokemon/presenter/pages/components/image_pokemon.dart';

class PokemonDetailPage extends StatelessWidget {
  const PokemonDetailPage();

  bodyWidget(BuildContext context) => Stack(
        children: <Widget>[
          const Align(alignment: Alignment.topCenter, child: ImagePokemon()),
          Positioned(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width - 20,
            left: 10.0,
            top: MediaQuery.of(context).size.height * 0.1,
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: const DetailsPokemon()),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.cyan,
        title: const Text("pikachu"),
      ),
      body: bodyWidget(context),
    );
  }
}

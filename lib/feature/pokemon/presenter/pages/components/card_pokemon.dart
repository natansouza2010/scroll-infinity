import 'package:flutter/material.dart';
import 'package:scrollinfinity/feature/pokemon/infra/model/pokemon_model.dart';
import 'package:scrollinfinity/feature/pokemon/presenter/pages/components/image_pokemon.dart';

class CardPokemon extends StatelessWidget {
  final PokemonModel? pokemon;
  const CardPokemon({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 2,
            color: Colors.blueAccent,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      width: 104,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      "#001",
                      style: TextStyle(color: Colors.blueAccent),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const ImagePokemon()
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Bulbasar",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

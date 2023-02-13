import 'package:flutter/material.dart';
import 'package:scrollinfinity/feature/pokemon/infra/model/pokemon_model.dart';
import 'package:scrollinfinity/feature/pokemon/presenter/pages/components/image_pokemon.dart';

class CardPokemon extends StatelessWidget {
  final PokemonModel? pokemon;
  const CardPokemon({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    var namePokemon = "";
    var idPokemon = "";
    if (pokemon?.name != null) {
      namePokemon = pokemon!.name[0].toUpperCase() + pokemon!.name.substring(1);
    }
    if (pokemon?.id != null) {
      idPokemon = pokemon!.id.toString().padLeft(3, '0');
    }
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
                  children: [
                    Text(
                      "#$idPokemon",
                      style: const TextStyle(color: Colors.blueAccent),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                ImagePokemon(
                  pokemon: pokemon,
                )
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  namePokemon,
                  style: const TextStyle(color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

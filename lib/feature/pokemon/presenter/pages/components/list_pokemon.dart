// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:scrollinfinity/feature/pokemon/infra/model/pokemon_model.dart';
import 'package:scrollinfinity/feature/pokemon/presenter/pages/components/card_pokemon.dart';

class ListPokemon extends StatelessWidget {
  final List<PokemonModel> pokemonsList;
  const ListPokemon({
    Key? key,
    required this.pokemonsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final pokemon = pokemonsList[index];
        return CardPokemon(pokemon: pokemon);
      },
    );
  }
}

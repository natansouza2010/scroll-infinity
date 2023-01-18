import 'package:flutter/material.dart';
import 'package:scrollinfinity/feature/pokemon/presenter/pages/components/app_bar_pokemon.dart';
import 'package:scrollinfinity/feature/pokemon/presenter/pages/components/card_pokemon.dart';

class PokemonsPage extends StatelessWidget {
  const PokemonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.amberAccent,
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Column(
            children: const [
              AppBarPokemon(),
              CardPokemon(pokemon: null),
            ],
          ),
        ),
      ),
    );
  }
}

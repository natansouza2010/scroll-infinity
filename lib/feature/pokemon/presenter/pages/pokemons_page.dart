import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:scrollinfinity/feature/pokemon/presenter/pages/components/app_bar_pokemon.dart';
import 'package:scrollinfinity/feature/pokemon/presenter/pages/components/list_pokemon.dart';
import 'package:scrollinfinity/feature/pokemon/presenter/state/pokemon_state.dart';
import 'package:scrollinfinity/feature/pokemon/presenter/store/pokemon_page_store.dart';

class PokemonsPage extends StatefulWidget {
  const PokemonsPage({super.key});

  @override
  State<PokemonsPage> createState() => _PokemonsPageState();
}

class _PokemonsPageState extends State<PokemonsPage> {
  final pokemonStore = Modular.get<PokemonPageStore>();
  @override
  void initState() {
    super.initState();
    pokemonStore.stateReaction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.amberAccent,
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Column(
              children: [
                const AppBarPokemon(),
                Observer(builder: (context) {
                  final pokemonState = pokemonStore.pokemonState;
                  if (pokemonState is ErrorPokemonState) {
                    return const Center(
                      child: Text("Ops!... Alguma coisa deu errado"),
                    );
                  }
                  if (pokemonState is SucessPokemonState) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: ListPokemon(pokemonsList: pokemonState.pokemons),
                    );
                  }
                  return const CircularProgressIndicator();
                }),
              ],
            ),
          )),
    );
  }
}

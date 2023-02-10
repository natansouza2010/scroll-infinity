import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
  late final ScrollController _scrollController;

  void _getMorePokemons() {
    var nextPageTrigger = _scrollController.position.maxScrollExtent - 100;
    final state = pokemonStore.pokemonState;
    if (_scrollController.position.pixels > nextPageTrigger &&
        state is SucessPokemonState) {
      pokemonStore.stateReaction();
    }
  }

  @override
  void initState() {
    super.initState();
    pokemonStore.stateReaction();
    _scrollController = ScrollController();
    _scrollController.addListener(_getMorePokemons);
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
          child: Observer(builder: (context) {
            final pokemonState = pokemonStore.pokemonState;
            final isSucess = pokemonState is SucessPokemonState;
            final isError = pokemonState is ErrorPokemonState;
            final isLoading = pokemonState is LoadingPokemonState;

            if (isError) {
              return const Center(
                  child: Text("Ops!... alguma coisa ocorreu de errado"));
            }
            if (isSucess || isLoading) {
              if (pokemonState.pokemons.isEmpty) {
                return const Center(
                  child: Text("Não existe pokemons"),
                );
              }

              return Column(
                children: [
                  Expanded(
                    child: ListPokemon(
                      scrollController: _scrollController,
                      pokemonsList: pokemonState.pokemons,
                    ),
                  ),
                  if (isLoading)
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      ),
                    ),
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
        ),
      ),
    );
  }
}

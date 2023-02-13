// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobx/mobx.dart';

import 'package:scrollinfinity/feature/pokemon/domain/usecase/get_all_pokemons.dart';
import 'package:scrollinfinity/feature/pokemon/presenter/state/pokemon_state.dart';
import 'package:async/async.dart';
part 'pokemon_page_store.g.dart';

class PokemonPageStore = _PokemonPageStore with _$PokemonPageStore;

abstract class _PokemonPageStore with Store {
  final GetAllPokemonsContract getAllPokemonsContract;
  CancelableOperation? cancellableOperation;

  _PokemonPageStore({
    required this.getAllPokemonsContract,
  });

  final int limit = 20;

  int offset = 0;

  @observable
  PokemonState pokemonState = InitialPokemonState();

  bool isFirstRequest = true;

  Future stateReaction([CancelableOperation? cancellableOperation]) async {
    await cancellableOperation?.cancel();
    if (isFirstRequest) {
      await setPokemonState(InitialPokemonState());
    }

    cancellableOperation =
        CancelableOperation<PokemonState>.fromFuture(findAllPokemons(offset));

    await setPokemonState(LoadingPokemonState(pokemons: pokemonState.pokemons));
    await setPokemonState(
        await cancellableOperation.valueOrCancellation(pokemonState));
  }

  Future<PokemonState> findAllPokemons(int offset) async {
    var result =
        await getAllPokemonsContract.call(limit: limit, offset: offset);
    return result.fold((l) => ErrorPokemonState(error: l, pokemons: []), (r) {
      setOffset(offset + r.length);
      isFirstRequest = false;
      return SucessPokemonState(pokemons: [...pokemonState.pokemons, ...r]);
    });
  }

  @action
  Future<void> setPokemonState(PokemonState newState) async =>
      pokemonState = newState;

  void setOffset(int newOffset) async => offset = newOffset;
}

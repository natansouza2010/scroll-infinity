// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokemonPageStore on _PokemonPageStore, Store {
  late final _$pokemonStateAtom =
      Atom(name: '_PokemonPageStore.pokemonState', context: context);

  @override
  PokemonState get pokemonState {
    _$pokemonStateAtom.reportRead();
    return super.pokemonState;
  }

  @override
  set pokemonState(PokemonState value) {
    _$pokemonStateAtom.reportWrite(value, super.pokemonState, () {
      super.pokemonState = value;
    });
  }

  late final _$setPokemonStateAsyncAction =
      AsyncAction('_PokemonPageStore.setPokemonState', context: context);

  @override
  Future<void> setPokemonState(PokemonState newState) {
    return _$setPokemonStateAsyncAction
        .run(() => super.setPokemonState(newState));
  }

  @override
  String toString() {
    return '''
pokemonState: ${pokemonState}
    ''';
  }
}

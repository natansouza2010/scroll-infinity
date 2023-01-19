// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:scrollinfinity/feature/pokemon/domain/errors/errors.dart';
import 'package:scrollinfinity/feature/pokemon/infra/model/pokemon_model.dart';

abstract class PokemonState {}

class SucessPokemonState implements PokemonState {
  List<PokemonModel> pokemons;
  SucessPokemonState({
    required this.pokemons,
  });
}

class InitialPokemonState extends SucessPokemonState {
  InitialPokemonState() : super(pokemons: []);
}

class LoadingPokemonState implements PokemonState {
  LoadingPokemonState();
}

class ErrorPokemonState implements PokemonState {
  final Failure error;
  ErrorPokemonState({required this.error});
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:scrollinfinity/feature/pokemon/domain/errors/errors.dart';
import 'package:scrollinfinity/feature/pokemon/infra/model/pokemon_model.dart';

abstract class PokemonState {
  final List<PokemonModel> pokemons;
  PokemonState({
    required this.pokemons,
  });
}

class SucessPokemonState extends PokemonState {
  SucessPokemonState({required super.pokemons});
}

class InitialPokemonState extends SucessPokemonState {
  InitialPokemonState() : super(pokemons: []);
}

class LoadingPokemonState extends PokemonState {
  LoadingPokemonState({super.pokemons = const []});
}

class ErrorPokemonState extends PokemonState {
  final Failure error;

  ErrorPokemonState({required super.pokemons, required this.error});
}

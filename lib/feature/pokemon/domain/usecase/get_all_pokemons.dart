// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:scrollinfinity/feature/pokemon/domain/errors/errors.dart';
import 'package:scrollinfinity/feature/pokemon/domain/repository/pokemon_repository_contract.dart';
import 'package:scrollinfinity/feature/pokemon/infra/model/pokemon_model.dart';

abstract class GetAllPokemonsContract {
  Future<Either<Failure, List<PokemonModel>>> call(
      {required int offset, required int limit});
}

class GetAllPokemonsUseCase implements GetAllPokemonsContract {
  PokemonRepositoryContract repositoryPokemon;

  GetAllPokemonsUseCase({
    required this.repositoryPokemon,
  });

  @override
  Future<Either<Failure, List<PokemonModel>>> call(
      {required int offset, required int limit}) async {
    final pokemons =
        await repositoryPokemon.getAllPokemons(limit: limit, offset: offset);
    return pokemons.fold((l) => throw Failure(), (r) => right(r));
  }
}

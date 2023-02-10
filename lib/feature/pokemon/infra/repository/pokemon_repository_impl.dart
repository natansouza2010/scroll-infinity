// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:scrollinfinity/feature/pokemon/domain/errors/errors.dart';
import 'package:scrollinfinity/feature/pokemon/domain/repository/pokemon_repository_contract.dart';
import 'package:scrollinfinity/feature/pokemon/infra/datasource/pokemon_remote_datasource_contract.dart';
import 'package:scrollinfinity/feature/pokemon/infra/model/pokemon_model.dart';
import 'package:scrollinfinity/feature/pokemon/infra/model/result_pokemon_model.dart';

class PokemonRepositoryImpl implements PokemonRepositoryContract {
  final PokemonRemoteDatasourceContract datasource;
  PokemonRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, List<PokemonModel>>> getAllPokemons(
      {required int offset, required int limit}) async {
    try {
      final pokemonList = <PokemonModel>[];
      final pokemonsResult =
          await datasource.getResultPokemons(limit: limit, offset: offset);
      final pokemonsFromResultModel =
          ResultPokemonModel.fromMap(pokemonsResult);

      if (pokemonsFromResultModel.results != null) {
        final resultsPokemons =
            Stream.fromIterable(pokemonsFromResultModel.results!);

        await for (var e in resultsPokemons.asyncMap((e) async {
          return PokemonModel.fromMap(await datasource.getPokemon(e.name));
        })) {
          pokemonList.add(e);
        }
      }
      return Right(pokemonList);
    } catch (error) {
      return Left(Failure());
    }
  }
}

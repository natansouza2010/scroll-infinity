// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:scrollinfinity/feature/pokemon/domain/errors/errors.dart';
import 'package:scrollinfinity/feature/pokemon/domain/repository/pokemon_repository_contract.dart';
import 'package:scrollinfinity/feature/pokemon/infra/datasource/pokemon_remote_datasource_contract.dart';
import 'package:scrollinfinity/feature/pokemon/infra/model/result_pokemon_model.dart';

class PokemonRepositoryImpl implements PokemonRepositoryContract {
  final PokemonRemoteDatasourceContract datasource;
  PokemonRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, ResultPokemonModel>> getAllPokemons() async {
    try {
      final pokemonsResult = await datasource.getAllPokemons();
      final pokemonsFromResultModel =
          ResultPokemonModel.fromMap(pokemonsResult);
      return Right(pokemonsFromResultModel);
    } catch (error) {
      return Left(Failure());
    }
    // TODO: implement getAllPokemons
  }
}

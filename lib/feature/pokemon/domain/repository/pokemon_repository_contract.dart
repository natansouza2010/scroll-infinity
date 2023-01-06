import 'package:dartz/dartz.dart';
import 'package:scrollinfinity/feature/pokemon/domain/errors/errors.dart';
import 'package:scrollinfinity/feature/pokemon/infra/model/pokemon_model.dart';

abstract class PokemonRepositoryContract {
  Future<Either<Failure, List<PokemonModel>>> getAllPokemons();
}

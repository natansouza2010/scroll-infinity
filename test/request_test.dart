import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:scrollinfinity/feature/pokemon/external/datasource/pokemon_remote_datasource_impl.dart';
import 'package:scrollinfinity/feature/pokemon/infra/repository/pokemon_repository_impl.dart';

void main() async {
  PokemonRemoteDatasourceImpl localDatasource =
      PokemonRemoteDatasourceImpl(dio: Dio());

  PokemonRepositoryImpl repositoryImpl =
      PokemonRepositoryImpl(datasource: localDatasource);

  request() async {
    final data = await repositoryImpl.getAllPokemons();
    final teste = Right(data);
  }

  await request();
}

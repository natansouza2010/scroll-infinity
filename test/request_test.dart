import 'package:dio/dio.dart';
import 'package:scrollinfinity/feature/pokemon/domain/usecase/get_all_pokemons.dart';
import 'package:scrollinfinity/feature/pokemon/external/datasource/pokemon_remote_datasource_impl.dart';
import 'package:scrollinfinity/feature/pokemon/infra/repository/pokemon_repository_impl.dart';

void main() async {
  PokemonRemoteDatasourceImpl localDatasource =
      PokemonRemoteDatasourceImpl(dio: Dio());

  PokemonRepositoryImpl repositoryImpl =
      PokemonRepositoryImpl(datasource: localDatasource);

  GetAllPokemonsContract usecase =
      GetAllPokemonsUseCase(repositoryPokemon: repositoryImpl);

  request() async {
    final data = usecase.call();
    print("oi");
    print(data);
  }

  await request();
}

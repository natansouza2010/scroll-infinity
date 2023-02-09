import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:scrollinfinity/feature/pokemon/domain/usecase/get_all_pokemons.dart';
import 'package:scrollinfinity/feature/pokemon/external/datasource/pokemon_remote_datasource_impl.dart';
import 'package:scrollinfinity/feature/pokemon/infra/datasource/pokemon_remote_datasource_contract.dart';
import 'package:scrollinfinity/feature/pokemon/infra/repository/pokemon_repository_impl.dart';
import 'package:scrollinfinity/feature/pokemon/presenter/pages/pokemons_page.dart';
import 'package:scrollinfinity/feature/pokemon/presenter/store/pokemon_page_store.dart';

class PokemonModule extends Module {
  @override
  List<Bind> get binds => [
        //Client HTTP
        Bind.factory((i) => Dio()),
        //Datasource
        Bind.factory<PokemonRemoteDatasourceContract>(
            (i) => PokemonRemoteDatasourceImpl(dio: i())),
        //Repostiroy
        Bind.factory<PokemonRepositoryImpl>(
            (i) => PokemonRepositoryImpl(datasource: i())),
        //Usecase
        Bind.factory<GetAllPokemonsContract>(
            (i) => GetAllPokemonsUseCase(repositoryPokemon: i())),
        //Store
        Bind.singleton((i) => PokemonPageStore(getAllPokemonsContract: i()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const PokemonsPage()),
      ];
}

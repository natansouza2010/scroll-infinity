import 'package:dio/dio.dart';
import 'package:scrollinfinity/core/constants/constant_api.dart';
import 'package:scrollinfinity/feature/pokemon/infra/datasource/pokemon_remote_datasource_contract.dart';

class PokemonRemoteDatasourceImpl implements PokemonRemoteDatasourceContract {
  final Dio dio;

  PokemonRemoteDatasourceImpl({required this.dio});

  @override
  Future<Map<String, dynamic>> getPokemon(String name) async {
    try {
      var resultFromApi = await dio.get("$url_poke_api/$name");
      if (resultFromApi.statusCode == 200) {
        return resultFromApi.data;
      } else {
        throw Exception();
      }
    } catch (error) {
      throw Exception();
    }
  }
  // limit=60&offset=60.

  @override
  Future<Map<String, dynamic>> getResultPokemons(
      {required int offset, required int limit}) async {
    try {
      var resultFromApi =
          await dio.get("$url_poke_api/?offset=$offset&limit=$limit");
      if (resultFromApi.statusCode == 200) {
        return resultFromApi.data;
      } else {
        throw Exception();
      }
    } catch (error) {
      throw Exception();
    }
  }
}

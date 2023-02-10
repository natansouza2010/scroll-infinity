abstract class PokemonRemoteDatasourceContract {
  Future<Map<String, dynamic>> getResultPokemons(
      {required int offset, required int limit});
  Future<Map<String, dynamic>> getPokemon(String name);
}

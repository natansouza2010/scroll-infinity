abstract class PokemonRemoteDatasourceContract {
  Future<Map<String, dynamic>> getResultPokemons();
  Future<Map<String, dynamic>> getPokemon(String name);
}

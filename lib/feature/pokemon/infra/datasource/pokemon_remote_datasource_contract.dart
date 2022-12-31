abstract class PokemonRemoteDatasourceContract {
  Future<Map<String, dynamic>> getAllPokemons();
  Future<dynamic> getPokemon();
}

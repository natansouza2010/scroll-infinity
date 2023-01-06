// ignore_for_file: public_member_api_docs, sort_constructors_first

// abstract class GetAllPokemonsContract {
//   Future<ResultPokemonModel> call();
// }

// class GetAllPokemonsUseCase implements GetAllPokemonsContract {
//   PokemonRepositoryContract repositoryPokemon;

//   GetAllPokemonsUseCase({
//     required this.repositoryPokemon,
//   });

//   @override
//   Future<ResultPokemonModel> call() async {
//     final pokemons = await repositoryPokemon.getAllPokemons();
//     return pokemons.fold((l) => throw Failure(), (r) => r);
//   }
// }

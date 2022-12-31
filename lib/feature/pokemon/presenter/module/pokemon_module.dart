import 'package:flutter_modular/flutter_modular.dart';
import 'package:scrollinfinity/feature/pokemon/presenter/pages/pokemons_page.dart';

class PokemonModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const PokemonsPage()),
      ];
}

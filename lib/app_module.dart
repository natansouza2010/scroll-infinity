import 'package:flutter_modular/flutter_modular.dart';
import 'package:scrollinfinity/feature/pokemon/presenter/module/pokemon_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        RedirectRoute('/', to: '/pokemons'),
        ModuleRoute('/pokemons', module: PokemonModule())
      ];
}

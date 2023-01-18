import 'package:mobx/mobx.dart';

// Include generated file
part 'pokemon_page_store.g.dart';

// This is the class used by rest of your codebase
class PokemonPageStore = _PokemonPageStore with _$PokemonPageStore;

// The store-class
abstract class _PokemonPageStore with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}

import 'package:flutter/material.dart';
import 'package:scrollinfinity/feature/pokemon/presenter/pages/pokemon_detail_page.dart';

class PokemonsPage extends StatelessWidget {
  const PokemonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Teste")),
      body: const PokemonDetailPage(),
    );
  }
}

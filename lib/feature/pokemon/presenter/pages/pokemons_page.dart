import 'package:flutter/material.dart';
import 'package:scrollinfinity/feature/pokemon/presenter/pages/components/search_app_bar_pokemon.dart';

class PokemonsPage extends StatelessWidget {
  const PokemonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: _buildAppBar(theme),
      body: Container(),
    );
  }
}

AppBar _buildAppBar(ThemeData theme) {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.access_alarm, color: theme.iconTheme.color),
            const SizedBox(
              width: 10,
            ),
            Text("Pokedéx",
                style: theme.textTheme.bodyText1!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 24)),
          ],
        ),
        Icon(Icons.arrow_drop_down, color: theme.iconTheme.color)
      ],
    ),
    bottom: const PreferredSize(
        preferredSize: Size.fromHeight(20), child: SearchAppBarPokemon()),
  );
}

import 'package:flutter/material.dart';
import 'package:scrollinfinity/feature/pokemon/presenter/pages/components/search_app_bar_pokemon.dart';

class AppBarPokemon extends StatelessWidget {
  const AppBarPokemon({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
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
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Icon(Icons.arrow_drop_down, color: theme.iconTheme.color),
            )
          ],
        ),
        const SearchAppBarPokemon()
      ],
    );
  }
}

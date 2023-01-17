import 'package:flutter/material.dart';

class SearchAppBarPokemon extends StatelessWidget {
  const SearchAppBarPokemon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(2))),
      child: const TextField(
          decoration: InputDecoration(
        icon: Icon(Icons.search),
        hintText: "Procurar",
        border: InputBorder.none,
      )),
    );
  }
}

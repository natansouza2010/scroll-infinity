import 'package:flutter/material.dart';

class SearchAppBarPokemon extends StatelessWidget {
  const SearchAppBarPokemon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328,
      height: 24,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(22))),
      child: const TextField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          icon: Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(Icons.search),
          ),
          hintText: "Procurar",
          alignLabelWithHint: true,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

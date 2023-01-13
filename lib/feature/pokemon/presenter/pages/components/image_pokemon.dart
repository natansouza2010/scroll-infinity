import 'package:flutter/material.dart';

class ImagePokemon extends StatelessWidget {
  const ImagePokemon({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: "Eita",
        child: Container(
          height: 200.0,
          width: 200.0,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('https://picsum.photos/250?image=9'))),
        ));
  }
}

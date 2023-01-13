import 'package:flutter/material.dart';

class DetailsPokemon extends StatelessWidget {
  const DetailsPokemon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        const SizedBox(
          height: 70.0,
        ),
        const Text(
          "Teste",
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        const Text("Height: 10 "),
        const Text("Weight: 10"),
        const Text(
          "Types",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          FilterChip(
              backgroundColor: Colors.amber,
              label: const Text("Teste2"),
              onSelected: (b) {})
        ]),
        const Text("Weakness", style: TextStyle(fontWeight: FontWeight.bold)),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          FilterChip(
              backgroundColor: Colors.red,
              label: const Text(
                "Aoba",
                style: TextStyle(color: Colors.white),
              ),
              onSelected: (b) {})
        ]),
      ],
    );
  }
}

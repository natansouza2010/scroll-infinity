import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:scrollinfinity/feature/pokemon/infra/model/pokemon_status_model.dart';

class PokemonModel {
  final String name;
  final List<PokemonStatusModel> stats;

  PokemonModel({
    required this.name,
    required this.stats,
  });

  PokemonModel copyWith({
    String? name,
    List<PokemonStatusModel>? stats,
  }) {
    return PokemonModel(
      name: name ?? this.name,
      stats: stats ?? this.stats,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'stats': stats.map((x) => x.toMap()).toList(),
    };
  }

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      name: map['name'] as String,
      stats: List<PokemonStatusModel>.from(
        (map['stats'] as List<dynamic>).map<PokemonStatusModel>(
          (x) => PokemonStatusModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonModel.fromJson(String source) =>
      PokemonModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PokemonModel(name: $name, stats: $stats)';

  @override
  bool operator ==(covariant PokemonModel other) {
    if (identical(this, other)) return true;

    return other.name == name && listEquals(other.stats, stats);
  }

  @override
  int get hashCode => name.hashCode ^ stats.hashCode;
}

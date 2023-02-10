// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:scrollinfinity/feature/pokemon/infra/model/pokemon_status_model.dart';

class PokemonModel {
  final String name;
  final int id;
  final List<PokemonStatusModel> stats;

  PokemonModel({
    required this.name,
    required this.id,
    required this.stats,
  });

  PokemonModel copyWith({
    String? name,
    int? id,
    List<PokemonStatusModel>? stats,
  }) {
    return PokemonModel(
      name: name ?? this.name,
      id: id ?? this.id,
      stats: stats ?? this.stats,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'stats': stats.map((x) => x.toMap()).toList(),
    };
  }

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      name: map['name'] as String,
      id: map['id'] as int,
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
  String toString() => 'PokemonModel(name: $name, id: $id, stats: $stats)';

  @override
  bool operator ==(covariant PokemonModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.id == id &&
        listEquals(other.stats, stats);
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode ^ stats.hashCode;
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:scrollinfinity/feature/pokemon/infra/model/pokemon_stat.dart';

class PokemonStatusModel {
  final int baseStat;
  final int effort;
  final PokemonStat stat;
  PokemonStatusModel({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  PokemonStatusModel copyWith({
    int? baseStat,
    int? effort,
    PokemonStat? stat,
  }) {
    return PokemonStatusModel(
      baseStat: baseStat ?? this.baseStat,
      effort: effort ?? this.effort,
      stat: stat ?? this.stat,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'baseStat': baseStat,
      'effort': effort,
      'stat': stat.toMap(),
    };
  }

  factory PokemonStatusModel.fromMap(Map<String, dynamic> map) {
    return PokemonStatusModel(
      baseStat: map['base_stat'] as int,
      effort: map['effort'] as int,
      stat: PokemonStat.fromMap(map['stat'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonStatusModel.fromJson(String source) =>
      PokemonStatusModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'PokemonStatusModel(baseStat: $baseStat, effort: $effort, stat: $stat)';

  @override
  bool operator ==(covariant PokemonStatusModel other) {
    if (identical(this, other)) return true;

    return other.baseStat == baseStat &&
        other.effort == effort &&
        other.stat == stat;
  }

  @override
  int get hashCode => baseStat.hashCode ^ effort.hashCode ^ stat.hashCode;
}

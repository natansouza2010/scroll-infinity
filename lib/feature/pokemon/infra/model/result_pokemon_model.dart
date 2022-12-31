// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:scrollinfinity/feature/pokemon/infra/model/pokemon_result_model.dart';

class ResultPokemonModel {
  final int? count;
  final String? next;
  final String? previous;
  final List<PokemonResultModel>? results;

  ResultPokemonModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  ResultPokemonModel copyWith({
    int? count,
    String? next,
    String? previous,
    List<PokemonResultModel>? result,
  }) {
    return ResultPokemonModel(
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      results: result ?? results,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'count': count,
      'next': next,
      'previous': previous,
      'result': results?.map((x) => x.toMap()).toList(),
    };
  }

  factory ResultPokemonModel.fromMap(Map<String, dynamic> map) {
    return ResultPokemonModel(
      count: map['count'] != null ? map['count'] as int : null,
      next: map['next'] != null ? map['next'] as String : null,
      previous: map['previous'] != null ? map['previous'] as String : null,
      results: map['results'] != null
          ? List<PokemonResultModel>.from(
              (map['results'] as List<dynamic>).map<PokemonResultModel?>(
                (x) => PokemonResultModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultPokemonModel.fromJson(String source) =>
      ResultPokemonModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ResultPokemonModel(count: $count, next: $next, previous: $previous, result: $results)';
  }

  @override
  bool operator ==(covariant ResultPokemonModel other) {
    if (identical(this, other)) return true;

    return other.count == count &&
        other.next == next &&
        other.previous == previous &&
        listEquals(other.results, results);
  }

  @override
  int get hashCode {
    return count.hashCode ^
        next.hashCode ^
        previous.hashCode ^
        results.hashCode;
  }
}

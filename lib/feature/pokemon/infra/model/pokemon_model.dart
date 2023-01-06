import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PokemonModel {
  final String name;
  final List<String> status;

  PokemonModel({
    required this.name,
    required this.status,
  });

  PokemonModel copyWith({
    String? name,
    List<String>? status,
  }) {
    return PokemonModel(
      name: name ?? this.name,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'status': status,
    };
  }

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
        name: map['name'] as String,
        status: List<String>.from(
          (map['status'] as List<String>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory PokemonModel.fromJson(String source) =>
      PokemonModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PokemonModel(name: $name, status: $status)';

  @override
  bool operator ==(covariant PokemonModel other) {
    if (identical(this, other)) return true;

    return other.name == name && listEquals(other.status, status);
  }

  @override
  int get hashCode => name.hashCode ^ status.hashCode;
}

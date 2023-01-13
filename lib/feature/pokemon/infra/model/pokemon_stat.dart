import 'dart:convert';

class PokemonStat {
  final String name;
  final String url;
  PokemonStat({
    required this.name,
    required this.url,
  });

  PokemonStat copyWith({
    String? name,
    String? url,
  }) {
    return PokemonStat(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': url,
    };
  }

  factory PokemonStat.fromMap(Map<String, dynamic> map) {
    return PokemonStat(
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonStat.fromJson(String source) =>
      PokemonStat.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PokemonStat(name: $name, url: $url)';

  @override
  bool operator ==(covariant PokemonStat other) {
    if (identical(this, other)) return true;

    return other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}

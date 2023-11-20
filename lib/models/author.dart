import 'models.dart';

class Author {
  String key;
  String name;

  Author({
    required this.key,
    required this.name,
  });

  factory Author.fromJson(String str) => Author.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Author.fromMap(Map<String, dynamic> json) => Author(
    key: json["key"],
    name: json["name"],
  );

  Map<String, dynamic> toMap() => {
    "key": key,
    "name": name,
  };
}

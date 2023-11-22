import 'models.dart';

/// Author info
///
/// This is the Information of an author.
/// This is the mapped response from the author page of The Open Library.
class AuthorInfo {
  String key;
  String name;
  String? personalName;
  List<int>? photos;

  /// This constructor is used to create an author info.
  AuthorInfo({
    required this.key,
    required this.name,
    this.personalName,
    this.photos,
  });

  /// This method is used to create an author info from a JSON string.
  factory AuthorInfo.fromJson(String str) =>
      AuthorInfo.fromMap(json.decode(str));

  /// This method is used to create an author info from a map.
  factory AuthorInfo.fromMap(Map<String, dynamic> json) => AuthorInfo(
        key: json["key"],
        name: json["name"],
        personalName: json["personal_name"],
        photos: json["photos"] == null
            ? []
            : List<int>.from(json["photos"]!.map((x) => x)),
      );

  /// This method is used to get the photo of the author otherwise a placeholder.
  get photo {
    if (photos == null || photos!.isEmpty || photos!.first.toString().isEmpty) {
      return 'https://i.stack.imgur.com/GNhxO.png';
    }
    return 'https://covers.openlibrary.org/a/id/${photos!.first}-L.jpg';
  }
}

import 'models.dart';

/// Work Info Model
///
/// A Work within the Open Library system is a logical collection of Editions.
/// This is also a mapped response from a work page of The Open Library.
class WorkInfo {
  String key;
  String title;
  String? description;
  List<int> covers;
  List<String> authors;
  String? createdDate;

  /// This constructor is used to create a work info.
  WorkInfo({
    required this.key,
    required this.title,
    this.description,
    required this.covers,
    required this.authors,
    this.createdDate,
  });

  /// This method is used to create a work info from a JSON string.
  factory WorkInfo.fromJson(String str) => WorkInfo.fromMap(json.decode(str));

  /// This method is used to create a work info from a map.
  factory WorkInfo.fromMap(Map<String, dynamic> json) => WorkInfo(
        description: _descriptionFromMap(json),
        title: json["title"],
        covers: json["covers"] == null
            ? []
            : List<int>.from(json["covers"]!.map((x) => x)),
        key: json["key"],
        authors: _authorKeysFromMap(json),
        createdDate: json["created"]["value"],
      );

  /// This method is used to get the author keys from the map.
  ///
  /// NOTE: This method was created to minimize the code redundancy.
  static List<String> _authorKeysFromMap(Map<String, dynamic> json) {
    List<String> authorKeys = [];

    if (json["authors"] != null) {
      json["authors"].forEach((author) {
        authorKeys.add(author["author"]["key"]);
      });
    }

    return authorKeys;
  }

  /// This method is used to get the description from the map.
  ///
  /// NOTE: This method was created to reconcile multiple JSON formats.
  static String? _descriptionFromMap(Map<String, dynamic> json) {
    if (json["description"] == null) {
      return null;
    }

    if (json["description"].runtimeType == String) {
      return json["description"];
    }

    return json["description"]["value"];
  }

  /// This method is used to get the cover.
  ///
  /// This returns a URL to the cover image otherwise a placeholder.
  String getCover() {
    if (covers.isNotEmpty) {
      return 'https://covers.openlibrary.org/b/id/${covers.first}-L.jpg';
    }
    return 'https://i.stack.imgur.com/GNhxO.png';
  }

  /// This method is used to get the formatted date.
  /// Formats date in the format of dd/mm/yyyy.
  get formattedDate {
    return createdDate?.split('T').first.split('-').reversed.join('/');
  }
}

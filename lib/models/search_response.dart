import 'models.dart';

/// Search response
///
/// This is the mapped response from the search page of The Open Library.
class SearchResponse {
  List<Work> works;

  /// This constructor is used to create a search response.
  SearchResponse({
    required this.works,
  });

  /// Converts the JSON response to a [SearchResponse] instance.
  factory SearchResponse.fromJson(String str) =>
      SearchResponse.fromMap(json.decode(str));

  /// Converts the JSON response to a [SearchResponse] instance.
  factory SearchResponse.fromMap(Map<String, dynamic> json) => SearchResponse(
        works: List<Work>.from(json["docs"].map((x) => Work.fromMap(x))),
      );
}

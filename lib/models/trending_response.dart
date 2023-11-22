import 'models.dart';

/// Trending response
///
/// This is the mapped response from the trending page of The Open Library.
class TrendingResponse {
  List<Work> works;

  /// This constructor is used to create a trending response.
  TrendingResponse({
    required this.works,
  });

  /// Converts the JSON response to a [TrendingResponse] instance.
  factory TrendingResponse.fromJson(String str) =>
      TrendingResponse.fromMap(json.decode(str));

  /// Converts the JSON response to a [TrendingResponse] instance.
  factory TrendingResponse.fromMap(Map<String, dynamic> json) =>
      TrendingResponse(
        works: List<Work>.from(json["works"].map((x) => Work.fromMap(x))),
      );
}

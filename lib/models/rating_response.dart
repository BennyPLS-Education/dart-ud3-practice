import 'dart:convert';

/// Rating response
///
/// This is the mapped response from the rating page of The Open Library.
class RatingsResponse {
  Summary summary;
  Map<String, int> counts;

  /// This constructor is used to create a rating response.
  RatingsResponse({
    required this.summary,
    required this.counts,
  });

  /// Converts the JSON response to a [RatingsResponse] instance.
  factory RatingsResponse.fromJson(String str) =>
      RatingsResponse.fromMap(json.decode(str));

  /// Converts the JSON response to a [RatingsResponse] instance.
  factory RatingsResponse.fromMap(Map<String, dynamic> json) => RatingsResponse(
        summary: Summary.fromMap(json["summary"]),
        counts:
            Map.from(json["counts"]).map((k, v) => MapEntry<String, int>(k, v)),
      );
}

/// Summary
///
/// This is the mapped response from the summary page of The Open Library.
class Summary {
  double? average;
  int count;
  double? sortable;

  /// This constructor is used to create a summary.
  Summary({
    this.average,
    required this.count,
    this.sortable,
  });

  /// Converts the JSON response to a [Summary] instance.
  factory Summary.fromJson(String str) => Summary.fromMap(json.decode(str));

  /// Converts the JSON response to a [Summary] instance.
  factory Summary.fromMap(Map<String, dynamic> json) => Summary(
        average: json["average"]?.toDouble(),
        count: json["count"],
        sortable: json["sortable"]?.toDouble(),
      );
}

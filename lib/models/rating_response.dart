import 'dart:convert';

class RatingsResponse {
  Summary summary;
  Map<String, int> counts;

  RatingsResponse({
    required this.summary,
    required this.counts,
  });

  factory RatingsResponse.fromJson(String str) =>
      RatingsResponse.fromMap(json.decode(str));

  factory RatingsResponse.fromMap(Map<String, dynamic> json) => RatingsResponse(
        summary: Summary.fromMap(json["summary"]),
        counts:
            Map.from(json["counts"]).map((k, v) => MapEntry<String, int>(k, v)),
      );
}

class Summary {
  double? average;
  int count;
  double? sortable;

  Summary({
    this.average,
    required this.count,
    this.sortable,
  });

  factory Summary.fromJson(String str) => Summary.fromMap(json.decode(str));

  factory Summary.fromMap(Map<String, dynamic> json) => Summary(
        average: json["average"]?.toDouble(),
        count: json["count"],
        sortable: json["sortable"]?.toDouble(),
      );
}

import 'models.dart';

class TrendingResponse {
  String query;
  List<Work> works;
  int days;
  int hours;

  TrendingResponse({
    required this.query,
    required this.works,
    required this.days,
    required this.hours,
  });

  factory TrendingResponse.fromJson(String str) => TrendingResponse.fromMap(json.decode(str));

  factory TrendingResponse.fromMap(Map<String, dynamic> json) => TrendingResponse(
    query: json["query"],
    works: List<Work>.from(json["works"].map((x) => Work.fromMap(x))),
    days: json["days"],
    hours: json["hours"],
  );
}
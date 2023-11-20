import 'models.dart';

class SearchResponse {
  int numFound;
  int start;
  bool numFoundExact;
  List<Work> works;
  int searchResponseNumFound;
  String q;
  dynamic offset;

  SearchResponse({
    required this.numFound,
    required this.start,
    required this.numFoundExact,
    required this.works,
    required this.searchResponseNumFound,
    required this.q,
    required this.offset,
  });

  factory SearchResponse.fromJson(String str) => SearchResponse.fromMap(json.decode(str));

  factory SearchResponse.fromMap(Map<String, dynamic> json) => SearchResponse(
    numFound: json["numFound"],
    start: json["start"],
    numFoundExact: json["numFoundExact"],
    works: List<Work>.from(json["docs"].map((x) => Work.fromMap(x))),
    searchResponseNumFound: json["num_found"],
    q: json["q"],
    offset: json["offset"],
  );
}
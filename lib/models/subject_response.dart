import 'models.dart';

/// Subject response
///
/// This is the mapped response from the diferents subjects pages of The Open Library.
class SubjectResponse {
  List<Work> works;

  /// This constructor is used to create a subject response.
  SubjectResponse({
    required this.works,
  });

  /// Converts the JSON response to a [SubjectResponse] instance.
  factory SubjectResponse.fromJson(String str) => SubjectResponse.fromMap(json.decode(str));

  /// Converts the JSON response to a [SubjectResponse] instance.
  factory SubjectResponse.fromMap(Map<String, dynamic> json) => SubjectResponse(
    works: List<Work>.from(json["works"].map((x) => Work.fromMap(x))),
  );

}
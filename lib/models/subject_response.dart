import 'models.dart';

class SubjectResponse {
  String key;
  String name;
  String subjectType;
  int workCount;
  List<Work> works;

  SubjectResponse({
    required this.key,
    required this.name,
    required this.subjectType,
    required this.workCount,
    required this.works,
  });

  factory SubjectResponse.fromJson(String str) => SubjectResponse.fromMap(json.decode(str));

  factory SubjectResponse.fromMap(Map<String, dynamic> json) => SubjectResponse(
    key: json["key"],
    name: json["name"],
    subjectType: json["subject_type"],
    workCount: json["work_count"],
    works: List<Work>.from(json["works"].map((x) => Work.fromMap(x))),
  );

}
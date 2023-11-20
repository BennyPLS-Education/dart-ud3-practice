import 'models.dart';

class WorkInfo {
  dynamic description;
  String title;
  List<int>? covers;
  List<String?>? subjectPlaces;
  List<String?>? subjects;
  List<String?>? subjectPeople;
  String key;
  List<WorkInfoAuthor> authors;
  List<String?>? subjectTimes;
  WorkInfoType type;
  int latestRevision;
  int revision;
  WorkInfoCreated created;
  WorkInfoCreated lastModified;
  List<WorkInfoLink>? links;
  List<WorkInfoExcerpt>? excerpts;

  WorkInfo({
    this.description,
    required this.title,
    this.covers,
    this.subjectPlaces,
    this.subjects,
    this.subjectPeople,
    required this.key,
    required this.authors,
    this.subjectTimes,
    required this.type,
    required this.latestRevision,
    required this.revision,
    required this.created,
    required this.lastModified,
    this.links,
    this.excerpts,
  });

  factory WorkInfo.fromJson(String str) => WorkInfo.fromMap(json.decode(str));

  factory WorkInfo.fromMap(Map<String, dynamic> json) => WorkInfo(
        description: json["description"].runtimeType == Null
            ? null
            : json["description"].runtimeType != Map
                ? json["description"]
                : WorkInfoCreated.fromMap(json["description"]),
        title: json["title"],
        covers: json["covers"] == null
            ? []
            : List<int>.from(json["covers"]!.map((x) => x)),
        subjectPlaces: json["subject_places"] == null
            ? []
            : List<String>.from(json["subject_places"]!.map((x) => x)),
        subjects: json["subjects"].runtimeType == Null
            ? null
            : List<String>.from(json["subjects"].map((x) => x)),
        subjectPeople: json["subject_people"] == null
            ? []
            : List<String>.from(json["subject_people"]!.map((x) => x)),
        key: json["key"],
        authors: List<WorkInfoAuthor>.from(
            json["authors"].map((x) => WorkInfoAuthor.fromMap(x))),
        subjectTimes: json["subject_times"] == null
            ? []
            : List<String>.from(json["subject_times"]!.map((x) => x)),
        type: WorkInfoType.fromMap(json["type"]),
        latestRevision: json["latest_revision"],
        revision: json["revision"],
        created: WorkInfoCreated.fromMap(json["created"]),
        lastModified: WorkInfoCreated.fromMap(json["last_modified"]),
        links: json["links"] == null
            ? []
            : List<WorkInfoLink>.from(
                json["links"]!.map((x) => WorkInfoLink.fromMap(x))),
        excerpts: json["excerpts"] == null
            ? []
            : List<WorkInfoExcerpt>.from(
                json["excerpts"]!.map((x) => WorkInfoExcerpt.fromMap(x))),
      );

  getCover({Sizes size = Sizes.L}) {
    if (covers != null && covers!.isNotEmpty) {
      return 'https://covers.openlibrary.org/b/id/${covers!.first}-$size.jpg';
    }
    return 'https://i.stack.imgur.com/GNhxO.png';
  }
}

class WorkInfoAuthor {
  dynamic type;
  WorkInfoType author;

  WorkInfoAuthor({
    required this.type,
    required this.author,
  });

  factory WorkInfoAuthor.fromJson(String str) =>
      WorkInfoAuthor.fromMap(json.decode(str));

  factory WorkInfoAuthor.fromMap(Map<String, dynamic> json) => WorkInfoAuthor(
        type: json["type"].runtimeType == String
            ? json["type"]
            : WorkInfoType.fromMap(json["type"]),
        author: WorkInfoType.fromMap(json["author"]),
      );

  get authorKey {
    return author.key;
  }
}

class WorkInfoType {
  String key;

  WorkInfoType({
    required this.key,
  });

  factory WorkInfoType.fromJson(String str) =>
      WorkInfoType.fromMap(json.decode(str));

  factory WorkInfoType.fromMap(Map<String, dynamic> json) => WorkInfoType(
        key: json["key"],
      );
}

class WorkInfoCreated {
  String type;
  String value;

  WorkInfoCreated({
    required this.type,
    required this.value,
  });

  factory WorkInfoCreated.fromJson(String str) =>
      WorkInfoCreated.fromMap(json.decode(str));

  factory WorkInfoCreated.fromMap(Map<String, dynamic> json) => WorkInfoCreated(
        type: json["type"],
        value: json["value"],
      );

  get formattedDate {
    return value.split('T').first.split('-').reversed.join('/');
  }
}

class WorkInfoExcerpt {
  String? comment;
  String excerpt;
  WorkInfoType? author;

  WorkInfoExcerpt({
    this.comment,
    required this.excerpt,
    this.author,
  });

  factory WorkInfoExcerpt.fromJson(String str) =>
      WorkInfoExcerpt.fromMap(json.decode(str));

  factory WorkInfoExcerpt.fromMap(Map<String, dynamic> json) => WorkInfoExcerpt(
      comment: json["comment"],
      excerpt: json["excerpt"],
      author: json["author"].runtimeType == Null
          ? null
          : WorkInfoType.fromMap(json["author"]));
}

class WorkInfoLink {
  String url;
  String title;
  WorkInfoType type;

  WorkInfoLink({
    required this.url,
    required this.title,
    required this.type,
  });

  factory WorkInfoLink.fromJson(String str) =>
      WorkInfoLink.fromMap(json.decode(str));

  factory WorkInfoLink.fromMap(Map<String, dynamic> json) => WorkInfoLink(
        url: json["url"],
        title: json["title"],
        type: WorkInfoType.fromMap(json["type"]),
      );
}

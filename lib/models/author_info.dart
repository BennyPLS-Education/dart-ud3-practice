import 'models.dart';

class AuthorInfo {
  String name;
  String? personalName;
  LastModified lastModified;
  String key;
  TypeClass type;
  int? id;
  int revision;
  int? latestRevision;
  LastModified? created;
  List<String>? sourceRecords;
  List<int>? photos;
  RemoteIds? remoteIds;
  String? title;
  dynamic bio;
  String? wikipedia;
  String? birthDate;
  List<Link>? links;
  String? deathDate;
  String? date;
  String? entityType;
  List<String>? alternateNames;

  AuthorInfo({
    required this.name,
    this.personalName,
    required this.lastModified,
    required this.key,
    required this.type,
    this.id,
    required this.revision,
    this.latestRevision,
    this.created,
    this.sourceRecords,
    this.photos,
    this.remoteIds,
    this.title,
    this.bio,
    this.wikipedia,
    this.birthDate,
    this.links,
    this.deathDate,
    this.date,
    this.entityType,
    this.alternateNames,
  });

  factory AuthorInfo.fromJson(String str) =>
      AuthorInfo.fromMap(json.decode(str));

  factory AuthorInfo.fromMap(Map<String, dynamic> json) => AuthorInfo(
        name: json["name"],
        personalName: json["personal_name"],
        lastModified: LastModified.fromMap(json["last_modified"]),
        key: json["key"],
        type: TypeClass.fromMap(json["type"]),
        id: json["id"],
        revision: json["revision"],
        latestRevision: json["latest_revision"],
        created: json["created"] == null
            ? null
            : LastModified.fromMap(json["created"]),
        sourceRecords: json["source_records"] == null
            ? []
            : List<String>.from(json["source_records"]!.map((x) => x)),
        photos: json["photos"] == null
            ? []
            : List<int>.from(json["photos"]!.map((x) => x)),
        remoteIds: json["remote_ids"] == null
            ? null
            : RemoteIds.fromMap(json["remote_ids"]),
        title: json["title"],
        bio: json["bio"],
        wikipedia: json["wikipedia"],
        birthDate: json["birth_date"],
        links: json["links"] == null
            ? []
            : List<Link>.from(json["links"]!.map((x) => Link.fromMap(x))),
        deathDate: json["death_date"],
        date: json["date"],
        entityType: json["entity_type"],
        alternateNames: json["alternate_names"] == null
            ? []
            : List<String>.from(json["alternate_names"]!.map((x) => x)),
      );

  get photo {
    if (photos == null || photos!.isEmpty) {
      return 'https://i.stack.imgur.com/GNhxO.png';
    }
    return 'https://covers.openlibrary.org/a/id/${photos!.first}-M.jpg';
  }
}

class LastModified {
  String type;
  String value;

  LastModified({
    required this.type,
    required this.value,
  });

  factory LastModified.fromJson(String str) =>
      LastModified.fromMap(json.decode(str));

  factory LastModified.fromMap(Map<String, dynamic> json) => LastModified(
        type: json["type"],
        value: json["value"],
      );
}

class Link {
  String title;
  String url;
  TypeClass type;

  Link({
    required this.title,
    required this.url,
    required this.type,
  });

  factory Link.fromJson(String str) => Link.fromMap(json.decode(str));

  factory Link.fromMap(Map<String, dynamic> json) => Link(
        title: json["title"],
        url: json["url"],
        type: TypeClass.fromMap(json["type"]),
      );
}

class TypeClass {
  String key;

  TypeClass({
    required this.key,
  });

  factory TypeClass.fromJson(String str) => TypeClass.fromMap(json.decode(str));

  factory TypeClass.fromMap(Map<String, dynamic> json) => TypeClass(
        key: json["key"],
      );
}

class RemoteIds {
  String wikidata;

  RemoteIds({
    required this.wikidata,
  });

  factory RemoteIds.fromJson(String str) => RemoteIds.fromMap(json.decode(str));

  factory RemoteIds.fromMap(Map<String, dynamic> json) => RemoteIds(
        wikidata: json["wikidata"],
      );
}
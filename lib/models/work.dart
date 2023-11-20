import 'models.dart';

class Work {
  String key;
  String title;
  int? editionCount;
  int? coverId;
  String? coverEditionKey;
  List<String>? subject;
  List<String>? iaCollection;
  bool? lendinglibrary;
  bool? printdisabled;
  String? lendingEdition;
  String? lendingIdentifier;
  List<Author>? authors;
  int? firstPublishYear;
  dynamic ia;
  bool? publicScan;
  bool hasFulltext;
  Availability? availability;
  bool? publicScanB;
  String? iaCollectionS;
  String? lendingEditionS;
  String? lendingIdentifierS;
  List<String>? language;
  List<String>? authorKey;
  List<String>? authorName;
  String? type;
  List<String>? seed;
  String? titleSuggest;
  String? titleSort;
  List<String>? editionKey;
  List<String>? publishDate;
  List<int?>? publishYear;
  int? numberOfPagesMedian;
  List<String>? isbn;
  int? lastModifiedI;
  int? ebookCountI;
  String? ebookAccess;
  List<String>? publisher;
  List<String>? publisherFacet;
  double? version;
  List<String>? authorFacet;

  Work({
    required this.key,
    required this.title,
    required this.editionCount,
    this.coverId,
    this.coverEditionKey,
    this.subject,
    this.iaCollection,
    this.lendinglibrary,
    this.printdisabled,
    this.lendingEdition,
    this.lendingIdentifier,
    this.authors,
    required this.firstPublishYear,
    this.ia,
    this.publicScan,
    required this.hasFulltext,
    this.availability,
    this.publicScanB,
    this.iaCollectionS,
    this.lendingEditionS,
    this.lendingIdentifierS,
    this.language,
    this.authorKey,
    this.authorName,
    this.type,
    this.seed,
    this.titleSuggest,
    this.titleSort,
    this.editionKey,
    this.publishDate,
    this.publishYear,
    this.numberOfPagesMedian,
    this.isbn,
    this.lastModifiedI,
    this.ebookCountI,
    this.ebookAccess,
    this.publisher,
    this.publisherFacet,
    this.version,
    this.authorFacet,
  });

  factory Work.fromJson(String str) => Work.fromMap(json.decode(str));

  factory Work.fromMap(Map<String, dynamic> json) => Work(
    key: json["key"],
    title: json["title"],
    editionCount: json["edition_count"],
    coverId: json["cover_id"] ?? json["cover_i"],
    coverEditionKey: json["cover_edition_key"],
    subject: json["subject"] == null ? [] : List<String>.from(json["subject"]!.map((x) => x)),
    iaCollection: json["ia_collection"] == null ? [] : List<String>.from(json["ia_collection"]!.map((x) => x)),
    lendinglibrary: json["lendinglibrary"],
    printdisabled: json["printdisabled"],
    lendingEdition: json["lending_edition"],
    lendingIdentifier: json["lending_identifier"],
    authors: json["authors"] == null ? [] : List<Author>.from(json["authors"]!.map((x) => Author.fromMap(x))),
    firstPublishYear: json["first_publish_year"],
    ia: json["ia"],
    publicScan: json["public_scan"],
    hasFulltext: json["has_fulltext"],
    availability: json["availability"] == null ? null : Availability.fromMap(json["availability"]),
    publicScanB: json["public_scan_b"],
    iaCollectionS: json["ia_collection_s"],
    lendingEditionS: json["lending_edition_s"],
    lendingIdentifierS: json["lending_identifier_s"],
    language: json["language"] == null ? [] : List<String>.from(json["language"]!.map((x) => x)),
    authorKey: json["author_key"] == null ? [] : List<String>.from(json["author_key"]!.map((x) => x)),
    authorName: json["author_name"] == null ? [] : List<String>.from(json["author_name"]!.map((x) => x)),
    type: json["type"],
    seed: json["seed"] == null ? [] : List<String>.from(json["seed"]!.map((x) => x)),
    titleSuggest: json["title_suggest"],
    titleSort: json["title_sort"],
    editionKey: json["edition_key"] == null ? [] : List<String>.from(json["edition_key"]!.map((x) => x)),
    publishDate: json["publish_date"] == null ? [] : List<String>.from(json["publish_date"]!.map((x) => x)),
    publishYear: json["publish_year"] == null ? [] : List<int>.from(json["publish_year"]!.map((x) => x)),
    numberOfPagesMedian: json["number_of_pages_median"],
    isbn: json["isbn"] == null ? [] : List<String>.from(json["isbn"]!.map((x) => x)),
    lastModifiedI: json["last_modified_i"],
    ebookCountI: json["ebook_count_i"],
    ebookAccess: json["ebook_access"],
    publisher: json["publisher"] == null ? [] : List<String>.from(json["publisher"]!.map((x) => x)),
    publisherFacet: json["publisher_facet"] == null ? [] : List<String>.from(json["publisher_facet"]!.map((x) => x)),
    version: json["_version_"]?.toDouble(),
    authorFacet: json["author_facet"] == null ? [] : List<String>.from(json["author_facet"]!.map((x) => x)),
  );

  String getCover({Sizes size = Sizes.L}) {
    if (coverId != null) {
      return 'https://covers.openlibrary.org/b/id/$coverId-${size}.jpg';
    }
    return 'https://i.stack.imgur.com/GNhxO.png';
  }
}

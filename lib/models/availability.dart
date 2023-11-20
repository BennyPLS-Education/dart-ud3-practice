import 'models.dart';

class Availability {
  Status status;
  bool? availableToBrowse;
  bool? availableToBorrow;
  bool? availableToWaitList;
  bool? isPrintDisabled;
  bool? isReadable;
  bool? isLendable;
  bool? isPreviewable;
  String identifier;
  String? isbn;
  dynamic oclc;
  String? openlibraryWork;
  String? openlibraryEdition;
  DateTime? lastLoanDate;
  String? numWaitList;
  DateTime? lastWaitListDate;
  bool isRestricted;
  bool? isBrowseable;
  Src src;
  String? errorMessage;

  Availability({
    required this.status,
    this.availableToBrowse,
    this.availableToBorrow,
    this.availableToWaitList,
    this.isPrintDisabled,
    this.isReadable,
    this.isLendable,
    this.isPreviewable,
    required this.identifier,
    this.isbn,
    this.oclc,
    this.openlibraryWork,
    this.openlibraryEdition,
    this.lastLoanDate,
    this.numWaitList,
    this.lastWaitListDate,
    required this.isRestricted,
    this.isBrowseable,
    required this.src,
    this.errorMessage,
  });

  factory Availability.fromJson(String str) => Availability.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Availability.fromMap(Map<String, dynamic> json) => Availability(
    status: statusValues.map[json["status"]]!,
    availableToBrowse: json["available_to_browse"],
    availableToBorrow: json["available_to_borrow"],
    availableToWaitList: json["available_to_waitlist"],
    isPrintDisabled: json["is_printdisabled"],
    isReadable: json["is_readable"],
    isLendable: json["is_lendable"],
    isPreviewable: json["is_previewable"],
    identifier: json["identifier"],
    isbn: json["isbn"],
    oclc: json["oclc"],
    openlibraryWork: json["openlibrary_work"],
    openlibraryEdition: json["openlibrary_edition"],
    lastLoanDate: json["last_loan_date"] == null ? null : DateTime.parse(json["last_loan_date"]),
    numWaitList: json["num_waitlist"],
    lastWaitListDate: json["last_waitlist_date"] == null ? null : DateTime.parse(json["last_waitlist_date"]),
    isRestricted: json["is_restricted"],
    isBrowseable: json["is_browseable"],
    src: srcValues.map[json["__src__"]]!,
    errorMessage: json["error_message"],
  );

  Map<String, dynamic> toMap() => {
    "status": statusValues.reverse[status],
    "available_to_browse": availableToBrowse,
    "available_to_borrow": availableToBorrow,
    "available_to_waitlist": availableToWaitList,
    "is_printdisabled": isPrintDisabled,
    "is_readable": isReadable,
    "is_lendable": isLendable,
    "is_previewable": isPreviewable,
    "identifier": identifier,
    "isbn": isbn,
    "oclc": oclc,
    "openlibrary_work": openlibraryWork,
    "openlibrary_edition": openlibraryEdition,
    "last_loan_date": lastLoanDate?.toIso8601String(),
    "num_waitlist": numWaitList,
    "last_waitlist_date": lastWaitListDate?.toIso8601String(),
    "is_restricted": isRestricted,
    "is_browseable": isBrowseable,
    "__src__": srcValues.reverse[src],
    "error_message": errorMessage,
  };
}

enum Src {
  CORE_MODELS_LENDING_GET_AVAILABILITY
}

final srcValues = _EnumValues({
  "core.models.lending.get_availability": Src.CORE_MODELS_LENDING_GET_AVAILABILITY
});

enum Status {
  BORROW_AVAILABLE,
  BORROW_UNAVAILABLE,
  ERROR,
  OPEN,
  PRIVATE
}

final statusValues = _EnumValues({
  "borrow_available": Status.BORROW_AVAILABLE,
  "borrow_unavailable": Status.BORROW_UNAVAILABLE,
  "error": Status.ERROR,
  "open": Status.OPEN,
  "private": Status.PRIVATE
});

class _EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  _EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
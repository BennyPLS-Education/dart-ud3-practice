import 'providers.dart';
import 'package:http/http.dart' as http;

/// Book provider
///
/// This class is used to fetch the information about books from a specified API.
class BookProvider extends ChangeNotifier {
  final _baseUri = 'openlibrary.org';

  List<Work> trending = [];
  bool isLoading = true;

  /// This constructor is used to create a book provider.
  BookProvider() {
    _getTrending();
  }

  /// Fetches the trending books from a specified API.
  ///
  /// The [key] parameter is the key of the book in the API.
  ///
  void _getTrending() async {
    var uri = Uri.https(_baseUri, '/trending.json', {
      "limit": "20",
    });

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      return;
    }

    trending = TrendingResponse.fromJson(response.body).works;

    isLoading = false;
    notifyListeners();
  }

  /// Fetches the information about a book from a specified API.
  ///
  /// The [key] parameter is the key of the book in the API.
  ///
  Future<List<Work>> subject(String subject) async {
    var uri = Uri.https(_baseUri, '/subjects/$subject.json', {
      "limit": "100",
    });

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      return [];
    }

    return SubjectResponse.fromJson(response.body).works;
  }

  /// Fetches the information about a book from a specified API.
  ///
  /// The [key] parameter is the key of the book in the API.
  ///
  Future<List<Work>> search(String query) async {
    var uri = Uri.https(_baseUri, '/search.json', {
      "q": query,
    });

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      return [];
    }

    return SearchResponse.fromJson(response.body).works;
  }

  /// Fetches the information about a book from a specified API.
  ///
  /// The [key] parameter is the key of the book in the API.
  ///
  Future<WorkInfo?> info(String key) async {
    var uri = Uri.https(_baseUri, '/$key.json');

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      return null;
    }

    final workInfo = jsonDecode(response.body);

    if (workInfo['location'] != null) {
      final location = workInfo['location'];

      return await info(location);
    }

    return WorkInfo.fromJson(response.body);
  }

  /// Fetches the rating of a book from a specified API.
  ///
  /// The [key] parameter is the key of the book in the API.
  ///
  Future<RatingsResponse?> ratings(String key) async {
    var uri = Uri.https(_baseUri, '/$key/ratings.json');

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      return null;
    }

    return RatingsResponse.fromJson(response.body);
  }
  /// Fetches the information about an author from a specified API.
  ///
  /// The [key] parameter is the key of the author in the API.
  ///
  Future<AuthorInfo?> getAutor(String key) async {
    var uri = Uri.https(_baseUri, '/$key.json');

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      return null;
    }

    return AuthorInfo.fromJson(response.body);
  }
}

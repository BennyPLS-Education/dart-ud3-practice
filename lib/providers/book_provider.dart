import 'providers.dart';
import 'package:http/http.dart' as http;

class BookProvider extends ChangeNotifier {
  final _baseUri = 'openlibrary.org';

  List<Work> trending = [];

  BookProvider() {
    _getTrending();
  }

  void _getTrending() async {
    var uri = Uri.https(_baseUri, '/trending.json', {
      "limit": "20",
    });

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      return;
    }

    trending = TrendingResponse.fromJson(response.body).works;

    notifyListeners();
  }

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

  Future<RatingsResponse?> ratings(String key) async {
    var uri = Uri.https(_baseUri, '/$key/ratings.json');

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      return null;
    }

    return RatingsResponse.fromJson(response.body);
  }

  Future<AuthorInfo?> getAutor(String key) async {
    var uri = Uri.https(_baseUri, '/$key.json');

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      return null;
    }

    return AuthorInfo.fromJson(response.body);
  }
}

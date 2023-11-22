import 'package:open_books_app/widgets/book_subject_slider.dart';

import 'screens.dart';

/// Home Page
///
/// The home page of the application.
class HomeScreen extends StatelessWidget {
  /// The list of subject (API-ENDPOINTS) to show in the application.
  static const subjects = [
    'love',
    'romance',
    'horror',
    'fantasy',
    'fiction',
    'mystery',
    'action',
    'history',
    'self-help',
    'poetry',
    'art_history',
    'nutrition',
    'physics',
    'biology',
    'chemistry',
    'mathematics',
    'programming',
    'computers',
    'business',
    'economics',
    'philosophy',
    'psychology',
    'sociology',
    'engineering',
    'medicine',
    'law',
    'education',
    'music',
    'sports'
  ];

  const HomeScreen() : super(key: null);

  @override
  Widget build(BuildContext context) {
    List<Widget> rows = [const TrendingCardSwiper()];

    rows.addAll(subjects.map((subject) => BookSubjectSlider(subject: subject)));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: WorkSearch());
            },
            icon: const Icon(Icons.search_outlined),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: rows),
      ),
    );
  }
}

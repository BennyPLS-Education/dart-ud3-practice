import 'package:open_books_app/widgets/book_subject_slider.dart';

import 'screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen() : super(key: null);

  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context, listen: true);

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
        child: Column(
          children: [
            CardSwiper(works: bookProvider.trending),
            const BookSubjectSlider(subject: 'love'),
            const BookSubjectSlider(subject: 'romance'),
            const BookSubjectSlider(subject: 'horror'),
            const BookSubjectSlider(subject: 'fantasy'),
            const BookSubjectSlider(subject: 'fiction'),
            const BookSubjectSlider(subject: 'mystery'),
            const BookSubjectSlider(subject: 'action'),
            const BookSubjectSlider(subject: 'history'),
            const BookSubjectSlider(subject: 'self-help'),
            const BookSubjectSlider(subject: 'poetry'),
            const BookSubjectSlider(subject: 'art_history'),
            const BookSubjectSlider(subject: 'nutrition'),
            const BookSubjectSlider(subject: 'physics'),
            const BookSubjectSlider(subject: 'biology'),
            const BookSubjectSlider(subject: 'chemistry'),
            const BookSubjectSlider(subject: 'mathematics'),
            const BookSubjectSlider(subject: 'programming'),
            const BookSubjectSlider(subject: 'computers'),
            const BookSubjectSlider(subject: 'business'),
            const BookSubjectSlider(subject: 'economics'),
            const BookSubjectSlider(subject: 'philosophy'),
            const BookSubjectSlider(subject: 'psychology'),
            const BookSubjectSlider(subject: 'sociology'),
            const BookSubjectSlider(subject: 'engineering'),
            const BookSubjectSlider(subject: 'medicine'),
            const BookSubjectSlider(subject: 'law'),
            const BookSubjectSlider(subject: 'education'),
            const BookSubjectSlider(subject: 'music'),
            const BookSubjectSlider(subject: 'sports'),
            const BookSubjectSlider(subject: 'sports'),
          ],
        ),
      ),
    );
  }
}

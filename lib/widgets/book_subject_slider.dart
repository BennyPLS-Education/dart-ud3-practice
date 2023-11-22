import 'package:open_books_app/widgets/work_poster.dart';

import 'widgets.dart';

/// Book subject slider
///
/// This class is used to create a book subject slider.
/// The information is based on a subject to find books.
class BookSubjectSlider extends StatelessWidget {
  final String subject;

  /// This constructor is used to create a Book Subject Slider.
  const BookSubjectSlider({required this.subject}) : super(key: null);

  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context, listen: true);

    return SizedBox(
      width: double.infinity,
      height: 260,
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
                '${subject[0].toUpperCase()}${subject.substring(1).replaceAll('_', ' ')}',
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(
            height: 5,
          ),
          _listBooks(bookProvider)
        ],
      ),
    );
  }

  /// The list of books
  Widget _listBooks(BookProvider bookProvider) {
    return FutureBuilder(
      future: bookProvider.subject(subject),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final works = snapshot.data!;

          return Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: works.length,
              itemBuilder: (_, int index) => WorkPoster(
                work: works[index],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return const ErrorIcon();
        } else {
          return const CenterLoadingIndicator();
        }
      },
    );
  }
}

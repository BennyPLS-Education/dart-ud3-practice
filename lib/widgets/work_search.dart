import 'package:open_books_app/widgets/work_poster.dart';

import 'widgets.dart';

/// Work search
///
/// This class is used to create a work search extending Search Delegate.
class WorkSearch extends SearchDelegate {
  /// This method is used to build the actions.
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  /// This method is used to build the leading.
  ///
  /// This returns an icon button.
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  /// This method is used to build the results.
  @override
  Widget buildResults(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context);

    return _workSearch(bookProvider);
  }

  /// This method is used to build the suggestions.
  @override
  Widget buildSuggestions(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context);

    return _workSearch(bookProvider);
  }

  /// This method is used to set the theme of the app bar.
  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context);
  }

  /// This method is used to create the work search.
  ///
  /// This returns a widget conditionally
  /// if is loading, a circular progress indicator
  /// if there are works, a list view with the works
  /// if there are no works, a text
  /// if there is an error, a text
  Widget _workSearch(BookProvider bookProvider) {
    return FutureBuilder(
      future: bookProvider.search(query),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final works = snapshot.data as List<Work>;

          if (works.isEmpty) {
            return const Center(
              child: Text('No hi ha resultats'),
            );
          }

          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: works.length,
            itemBuilder: (_, int index) => WorkPoster(
              work: works[index],
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

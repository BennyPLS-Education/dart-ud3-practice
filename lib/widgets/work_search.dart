import 'package:open_books_app/widgets/work_poster.dart';

import 'widgets.dart';

class WorkSearch extends SearchDelegate {
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

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context);

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
          print(snapshot.error);
          return const Center(
            child: Text('Ha hagut un error'),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context);

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
          return const Center(
              child: Icon(
            Icons.error_outline,
            color: Colors.redAccent,
            size: 50,
          ));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

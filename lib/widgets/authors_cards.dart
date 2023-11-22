import 'widgets.dart';

/// Author Cards
///
/// Is a slider with a list of authors.
class AuthorsCards extends StatelessWidget {
  final List<String> authors;

  /// The constructor of the Autor Cards
  const AuthorsCards({required this.authors}) : super(key: null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Autors', style: Theme.of(context).textTheme.headline6),
        const Divider(indent: 20, endIndent: 20),
        SizedBox(
          width: double.infinity,
          height: 200,
          child: _body(),
        ),
      ],
    );
  }

  /// The body of the widget.
  /// Returns conditionally a widget based on authors list
  /// if isEmpty will return a text
  /// else will return a card of the author
  Widget _body() {
    if (authors.isEmpty) {
      return const Center(
        child: Text(
          'No hay información',
          style: TextStyle(fontSize: 18),
        ),
      );
    }

    return ListView.builder(
      itemCount: authors.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) => _AuthorCard(
        authorKey: authors[index],
      ),
    );
  }
}

/// Author Card
///
/// Card of a Author showing the picture and name or a placeholder of an image
class _AuthorCard extends StatelessWidget {
  final String authorKey;

  const _AuthorCard({required this.authorKey}) : super(key: null);

  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context, listen: false);

    return FutureBuilder(
      future: bookProvider.getAutor(authorKey),
      builder: (BuildContext context, AsyncSnapshot<AuthorInfo?> snapshot) {
        if (snapshot.hasData) {
          final author = snapshot.data;

          if (author == null) {
            return const Center();
          }

          return _card(author);
        } else if (snapshot.hasError) {
          return const ErrorIcon(expanded: false);
        } else {
          return const CenterLoadingIndicator(expanded: false);
        }
      },
    );
  }

  /// The author card
  Container _card(AuthorInfo author) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: NetworkImage(author.photo),
              height: 140,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            author.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

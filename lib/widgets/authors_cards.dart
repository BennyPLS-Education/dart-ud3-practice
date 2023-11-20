import 'widgets.dart';

class AuthorsCards extends StatelessWidget {
  final List<WorkInfoAuthor> authors;

  const AuthorsCards({required this.authors}) : super(key: null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Autors', style: Theme.of(context).textTheme.headline6),
        const Divider( indent: 20, endIndent: 20),
        SizedBox(
          width: double.infinity,
          height: 200,
          child: authors.isEmpty
              ? const Center(
                child: Text(
                  'No hay información',
                  style: TextStyle(fontSize: 18),
                ),
              )
              : ListView.builder(
                itemCount: authors.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) =>
                    _AuthorCard(
                  author: authors[index],
                ),
              ),
        ),
      ],
    );
  }
}

class _AuthorCard extends StatelessWidget {
  final WorkInfoAuthor author;

  const _AuthorCard({required this.author}) : super(key: null);

  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context, listen: false);

    return FutureBuilder(
      future: bookProvider.getAutor(author.authorKey),
      builder: (BuildContext context, AsyncSnapshot<AuthorInfo?> snapshot) {
        if (snapshot.hasData) {
          final author = snapshot.data;

          if (author == null) {
            return const Center();
          }

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

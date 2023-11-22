import 'package:url_launcher/url_launcher.dart';

import 'screens.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen() : super(key: null);

  @override
  Widget build(BuildContext context) {
    final work = ModalRoute.of(context)?.settings.arguments as Work;
    final bookProvider = Provider.of<BookProvider>(context, listen: false);

    return Scaffold(
      body: FutureBuilder(
        future: bookProvider.info(work.key),
        builder: (BuildContext context, AsyncSnapshot<WorkInfo?> snapshot) {
          if (snapshot.hasData) {
            final workInfo = snapshot.data;

            if (workInfo == null) {
              return const Center(
                child: Text('No s\'ha trobat informació'),
              );
            }

            return CustomScrollView(
              slivers: [
                _CustomAppBar(workInfo: workInfo),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      _TitileAndInfo(workInfo: workInfo),
                      _Overview(workInfo: workInfo),
                      AuthorsCards(authors: workInfo.authors),
                    ],
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return const ErrorIcon(expanded: false);
          } else {
            return const CenterLoadingIndicator(expanded: false);
          }
        },
      ),
    );
  }
}

/// A Silver App Bar to display the book cover.
class _CustomAppBar extends StatelessWidget {
  final WorkInfo workInfo;

  const _CustomAppBar({required this.workInfo}) : super(key: null);

  @override
  Widget build(BuildContext context) {
    // Exactament igual que la AppBaer però amb bon comportament davant scroll
    return SliverAppBar(
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(10),
        title: Text(
          workInfo.title,
          style: const TextStyle(fontSize: 16),
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'),
          image: NetworkImage(workInfo.getCover()),
          fit: BoxFit.cover,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            launchUrl(
              Uri(scheme: 'https', host: 'openlibrary.org', path: workInfo.key),
              mode: LaunchMode.inAppWebView,
            );
          },
          icon: const Icon(Icons.language),
        ),
      ],
    );
  }
}

class _TitileAndInfo extends StatelessWidget {
  final WorkInfo workInfo;

  const _TitileAndInfo({required this.workInfo}) : super(key: null);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final bookProvider = Provider.of<BookProvider>(context, listen: false);

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          Column(
            children: [
              Text(
                workInfo.title,
                style: textTheme.headlineSmall,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                softWrap: true,
              ),
              const SizedBox(height: 10),
              _ratings(bookProvider)
            ],
          )
        ],
      ),
    );
  }

  Widget _ratings(BookProvider bookProvider) {
    return FutureBuilder(
        future: bookProvider.ratings(workInfo.key),
        builder:
            (BuildContext context, AsyncSnapshot<RatingsResponse?> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.summary.average == null) {
              return const Center(child: Text('No hi ha puntuacions'));
            }

            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                snapshot.data!.summary.average!.round(),
                (index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return const ErrorIcon(expanded: false);
          } else {
            return const CenterLoadingIndicator(expanded: false);
          }
        });
  }
}

class _Overview extends StatelessWidget {
  final WorkInfo workInfo;

  const _Overview({required this.workInfo}) : super(key: null);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Data de llançament :'),
              const SizedBox(width: 5),
              Text(
                workInfo.formattedDate ?? 'Sense data',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text('Sinopsi',
              style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
          const Divider(),
          Text(
            workInfo.description ?? 'Sense sinopsi',
            textAlign: TextAlign.justify,
            maxLines: 30,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ],
      ),
    );
  }
}

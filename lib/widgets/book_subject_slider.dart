import 'package:open_books_app/widgets/work_poster.dart';

import 'widgets.dart';

class BookSubjectSlider extends StatelessWidget {
  final String subject;

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
          FutureBuilder(
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
                  print(snapshot.error);
                  print(snapshot.stackTrace);
                  return const Center(
                      child: Icon(
                    Icons.error_outline,
                    color: Colors.redAccent,
                    size: 50,
                  ));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              })
        ],
      ),
    );
  }
}

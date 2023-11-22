import 'package:card_swiper/card_swiper.dart';

import 'widgets.dart';

/// Trending card swiper
///
/// This class is used to create a card swiper with the trending books.
class TrendingCardSwiper extends StatelessWidget {
  const TrendingCardSwiper() : super(key: null);

  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context, listen: true);
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text('Trending',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          _body(bookProvider, size)
        ],
      ),
    );
  }

  /// This method is used to create the body.
  ///
  /// This returns a widget conditionally
  /// if the books are loading, a loading widget
  /// if there are trending books, a swiper
  /// if there are no trending books, a text
  Widget _body(BookProvider bookProvider, Size size) {
    if (bookProvider.isLoading) {
      return const CenterLoadingIndicator();
    }

    if (bookProvider.trending.isEmpty) {
      return const Center(child: Text('No s\'ha trobat informació'));
    }

    return _swiper(bookProvider.trending, size);
  }

  /// This method is used to create a swiper.
  ///
  /// This returns a swiper with the trending books.
  Swiper _swiper(List<Work> works, Size size) {
    return Swiper(
      itemCount: works.length,
      layout: SwiperLayout.STACK,
      itemWidth: size.width * 0.6,
      itemHeight: size.height * 0.4,
      itemBuilder: (BuildContext context, int index) {
        return _card(works, index, context, size);
      },
    );
  }

  /// This method is used to create a card.
  ///
  /// This returns a card with the cover of the book.
  Widget _card(List<Work> works, int index, BuildContext context, Size size) {
    final work = works[index];
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'details', arguments: work),
      child: work.getCoverWidget(),
    );
  }
}

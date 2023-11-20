import 'package:card_swiper/card_swiper.dart';

import 'widgets.dart';

class CardSwiper extends StatelessWidget {
  final List<Work> works;

  const CardSwiper({required this.works}) : super(key: null);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (works.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

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
          Swiper(
            itemCount: works.length,
            layout: SwiperLayout.STACK,
            itemWidth: size.width * 0.6,
            itemHeight: size.height * 0.4,
            itemBuilder: (BuildContext context, int index) {
              final work = works[index];

              return GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, 'details', arguments: work),
                child: work.getCover() != 'https://i.stack.imgur.com/GNhxO.png'
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: FadeInImage(
                            placeholder: const AssetImage('assets/no-image.jpg'),
                            image: NetworkImage(work.getCover()),
                            fit: BoxFit.cover))
                    : Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey,
                          border: Border.all(color: Colors.redAccent, width: 5),
                        ),
                        child: Center(
                          child: Text(work.title, style: const TextStyle(fontSize: 20), textAlign: TextAlign.center,),
                        ),
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}

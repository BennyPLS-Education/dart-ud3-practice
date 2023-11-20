import 'widgets.dart';

class WorkPoster extends StatelessWidget {
  final Work work;

  const WorkPoster({required this.work}) : super(key: null);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 220,
      // color: Colors.green,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: work),
            child: work.getCover() != 'https://i.stack.imgur.com/GNhxO.png'
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage(
                      placeholder: const AssetImage('assets/no-image.jpg'),
                      image: NetworkImage(work.getCover()),
                      height: 190,
                      width: 130,
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey,
                      border: Border.all(color: Colors.redAccent, width: 5),
                    ),
                    height: 190,
                    width: 130,
                    child: Center(
                      child: Text(
                        work.title,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            work.title,
            style: const TextStyle(fontSize: 13),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

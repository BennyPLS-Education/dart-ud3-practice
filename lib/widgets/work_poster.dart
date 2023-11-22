import 'widgets.dart';

/// Work poster
///
/// This class is used to create a work poster.
class WorkPoster extends StatelessWidget {
  final Work work;

  /// This constructor is used to create a work poster.
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
            child: work.getCoverWidget(),
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

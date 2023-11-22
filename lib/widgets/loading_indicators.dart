import 'widgets.dart';

/// Center loading indicator
///
/// This class is used to create a center loading indicator.
class CenterLoadingIndicator extends StatelessWidget {
  final bool expanded;

  const CenterLoadingIndicator({this.expanded = true}) : super(key: null);

  @override
  Widget build(BuildContext context) {
    if (!expanded) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return const Expanded(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

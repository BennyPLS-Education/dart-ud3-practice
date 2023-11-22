import 'widgets.dart';

/// Error Icon
///
/// A Centered Error Icon
class ErrorIcon extends StatelessWidget {
  final bool expanded;

  const ErrorIcon({this.expanded = true}) : super(key: null);

  @override
  Widget build(BuildContext context) {
    if (!expanded) {
      return const Center(
        child: Icon(
          Icons.error_outline,
          color: Colors.redAccent,
          size: 50,
        ),
      );
    }

    return const Expanded(
      child: Center(
        child: Icon(
          Icons.error_outline,
          color: Colors.redAccent,
          size: 50,
        ),
      ),
    );
  }
}

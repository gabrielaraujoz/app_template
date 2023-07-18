import 'package:flutter/widgets.dart';

class CustomFadePage<T> extends Page<T> {
  final Widget child;

  const CustomFadePage({
    required this.child,
    super.key,
  });

  @override
  Route<T> createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return FadeTransition(
          opacity: Tween<double>(
            begin: 0,
            end: 1,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.linearToEaseOut,
              reverseCurve: Curves.easeInToLinear,
            ),
          ),
          child: child,
        );
      },
    );
  }
}

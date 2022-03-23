import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

/// [SliverAnimatedSwitcher] with pre-set duration
class NewsAnimatedSwitcher extends StatelessWidget {
  final Widget child;
  final Duration duration;

  const NewsAnimatedSwitcher({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAnimatedSwitcher(
      child: child,
      duration: duration,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tech_crunch_news/theme/color_scheme.dart';

class NewsShimmer extends StatelessWidget {
  final Widget child;

  const NewsShimmer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: child,
      baseColor: Theme.of(context).colorScheme.lightGrey,
      highlightColor: Theme.of(context).colorScheme.lightGrey.withOpacity(0.6),
    );
  }
}

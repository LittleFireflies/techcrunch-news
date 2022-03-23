import 'package:flutter/material.dart';
import 'package:tech_crunch_news/widgets/news_shimmer.dart';

class ArticleListLoadingView extends StatelessWidget {
  const ArticleListLoadingView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NewsShimmer(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: const [
            NewsCardSkeleton(),
            SizedBox(height: 32),
            NewsCardSkeleton(),
          ],
        ),
      ),
    );
  }
}

class NewsCardSkeleton extends StatelessWidget {
  const NewsCardSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100,
          height: 60,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 200,
                height: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 4),
              Container(
                width: 150,
                height: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 20),
              Container(
                width: 100,
                height: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

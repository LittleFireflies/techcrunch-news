import 'package:flutter/material.dart';
import 'package:tech_crunch_news/theme/typography.dart';

class ArticleListHeader extends StatelessWidget {
  const ArticleListHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, top: 24.0, right: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Find the Latest Update',
            style: Theme.of(context).textTheme.bigTitle,
          ),
          const SizedBox(height: 24),
          const TextField(
            decoration: InputDecoration(
              hintText: 'Search for News',
              suffixIcon: Icon(Icons.search),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Featured Stories',
            style: Theme.of(context).textTheme.sectionTitle,
          ),
        ],
      ),
    );
  }
}

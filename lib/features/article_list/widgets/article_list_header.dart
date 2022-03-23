import 'package:flutter/material.dart';
import 'package:tech_crunch_news/features/search_news/view/search_news_page.dart';
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
          TextField(
            decoration: const InputDecoration(
              hintText: 'Search for News',
              suffixIcon: Icon(Icons.search),
            ),
            textInputAction: TextInputAction.search,
            onSubmitted: (query) {
              Navigator.pushNamed(
                context,
                SearchNewsPage.routeName,
                arguments: query,
              );
            },
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

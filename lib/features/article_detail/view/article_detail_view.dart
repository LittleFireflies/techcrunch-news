import 'package:flutter/material.dart';
import 'package:tech_crunch_news/features/article_detail/widgets/article_detail_body.dart';
import 'package:tech_crunch_news/api/models/article.dart';
import 'package:tech_crunch_news/widgets/news_app_bar.dart';

class ArticleDetailPage extends StatelessWidget {
  static const routeName = 'articleDetailPage';

  final Article article;

  const ArticleDetailPage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const NewsSliverAppBar(),
          SliverToBoxAdapter(
            child: ArticleDetailBody(article: article),
          )
        ],
      ),
    );
  }
}

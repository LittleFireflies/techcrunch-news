import 'package:flutter/material.dart';
import 'package:tech_crunch_news/features/article_webview/view/article_webview.dart';
import 'package:tech_crunch_news/repositories/models/article.dart';

class ArticleDetailBody extends StatelessWidget {
  final Article article;

  const ArticleDetailBody({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
                foregroundColor: Colors.white,
                child: Text(article.source.name[0]),
              ),
              const SizedBox(width: 16),
              Container(
                width: 2,
                height: 48,
                color: Colors.black,
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.publishedAt,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    article.source.name,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 24),
          Text(
            article.title,
            style: const TextStyle(
              fontSize: 36,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            article.description,
            style: const TextStyle(
              fontSize: 22,
              color: Color(0xFF616161),
            ),
          ),
          const SizedBox(height: 24),
          InkWell(
            onTap: () => Navigator.pushNamed(
              context,
              ArticleWebview.routeName,
              arguments: article.url,
            ),
            child: const Text(
              'Read news',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Container(
            height: 4,
            width: 48,
            color: Colors.black,
          ),
          const SizedBox(height: 24),
          Image.network(article.urlToImage),
        ],
      ),
    );
  }
}

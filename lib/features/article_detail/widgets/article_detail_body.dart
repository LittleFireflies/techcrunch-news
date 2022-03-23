import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tech_crunch_news/features/article_webview/view/article_webview.dart';
import 'package:tech_crunch_news/repositories/models/article.dart';
import 'package:tech_crunch_news/theme/typography.dart';

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
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
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
                    DateFormat.yMMMMd().format(
                      DateTime.parse(article.publishedAt),
                    ),
                    style: Theme.of(context).textTheme.displayDate,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    article.source.name,
                    style: Theme.of(context).textTheme.sectionTitle,
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 24),
          Text(
            article.title,
            style: Theme.of(context).textTheme.bigTitle.copyWith(
                  fontWeight: FontWeight.normal,
                ),
          ),
          const SizedBox(height: 24),
          Text(
            article.description,
            style: Theme.of(context).textTheme.title.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(height: 24),
          InkWell(
            onTap: () => Navigator.pushNamed(
              context,
              ArticleWebview.routeName,
              arguments: article.url,
            ),
            child: Text(
              'Read news',
              style: Theme.of(context).textTheme.sectionTitle,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            height: 4,
            width: 48,
            color: Colors.black,
          ),
          const SizedBox(height: 24),
          CachedNetworkImage(
            imageUrl: article.urlToImage,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          )
        ],
      ),
    );
  }
}

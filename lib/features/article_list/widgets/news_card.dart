import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tech_crunch_news/features/article_detail/view/article_detail_view.dart';
import 'package:tech_crunch_news/repositories/models/article.dart';
import 'package:tech_crunch_news/theme/typography.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          ArticleDetailPage.routeName,
          arguments: article,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: article.urlToImage,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              width: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.title,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Read news',
                    style: Theme.of(context).textTheme.display,
                  ),
                  const SizedBox(height: 4),
                  Container(
                    height: 2,
                    width: 48,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

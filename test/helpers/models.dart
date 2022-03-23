import 'package:tech_crunch_news/api/models/article.dart';
import 'package:tech_crunch_news/api/models/news_response.dart';
import 'package:tech_crunch_news/api/models/source.dart';

class TestModels {
  static const newsResponse = NewsResponse(
    status: 'ok',
    totalResults: 1,
    articles: [article],
  );

  static const article = Article(
      source: source,
      author: 'John Doe',
      title: 'Awesome News',
      description: 'Awesome News description',
      url: 'url',
      urlToImage: 'urlToImage',
      publishedAt: '2022-01-01T23:23:23',
      content: 'content');

  static const source = Source(
    id: 'techcrunch',
    name: 'TechCrunch',
  );
}

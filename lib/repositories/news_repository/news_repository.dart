import 'package:tech_crunch_news/api/api_service.dart';
import 'package:tech_crunch_news/api/models/article.dart';

class NewsRepository {
  final ApiService _apiService;

  NewsRepository({required ApiService apiService}) : _apiService = apiService;

  Future<List<Article>> getTopHeadlineNews() async {
    final response = await _apiService.getTopHeadlineNews();

    return response.articles;
  }

  Future<List<Article>> searchNews({required String query}) async {
    final response = await _apiService.searchNews(query: query);

    return response.articles;
  }
}

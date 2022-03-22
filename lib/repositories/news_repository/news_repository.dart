import 'package:tech_crunch_news/repositories/api/api_service.dart';
import 'package:tech_crunch_news/repositories/models/article.dart';

class NewsRepository {
  final ApiService _apiService;

  NewsRepository({required ApiService apiService}) : _apiService = apiService;

  Future<List<Article>> getTopHeadlineNews() async {
    final response = await _apiService.getTopHeadlineNews();

    return response.articles;
  }
}

import 'package:tech_crunch_news/repositories/api/api_service.dart';
import 'package:tech_crunch_news/repositories/models/news_response.dart';

class NewsApiRepository {
  final ApiService _apiService;

  NewsApiRepository({required ApiService apiService})
      : _apiService = apiService;

  Future<NewsResponse> getTopHeadlineNews() async {
    return _apiService.getTopHeadlineNews();
  }
}

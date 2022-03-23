import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tech_crunch_news/api/api_service.dart';
import 'package:tech_crunch_news/repositories/news_repository/news_repository.dart';

import '../../helpers/models.dart';

class MockApiService extends Mock implements ApiService {}

void main() {
  group('NewsRepository', () {
    late ApiService apiService;
    late NewsRepository repository;

    const newsResponse = TestModels.newsResponse;

    setUp(() {
      apiService = MockApiService();
      repository = NewsRepository(apiService: apiService);
    });

    group('getTopHeadlineNews', () {
      test('return article list from api service', () async {
        when(() => apiService.getTopHeadlineNews())
            .thenAnswer((_) async => newsResponse);

        final result = await repository.getTopHeadlineNews();

        expect(result, newsResponse.articles);
      });
    });

    group('searchNews', () {
      test('return article list from api service', () async {
        when(() => apiService.searchNews(query: 'Bitcoin'))
            .thenAnswer((_) async => newsResponse);

        final result = await repository.searchNews(query: 'Bitcoin');

        expect(result, newsResponse.articles);
      });
    });
  });
}

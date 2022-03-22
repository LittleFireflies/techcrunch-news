import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tech_crunch_news/repositories/api/api_service.dart';
import 'package:tech_crunch_news/utils/exceptions.dart';

import '../../helpers/json_reader.dart';
import '../../helpers/models.dart';

class MockHttpClient extends Mock implements Client {}

void main() {
  late Client client;
  late ApiService apiService;

  setUp(() {
    client = MockHttpClient();
    apiService = ApiService(client);
  });

  group('getTopHeadlineNews', () {
    test(
      'return NewsResponse '
      'when statusCode is 200',
      () async {
        // arrange
        when(() => client.get(Uri.parse(
                'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=31b1d418811249f0970f756bca4cf906')))
            .thenAnswer((_) async =>
                Response(readJson('dummy_data/top_headlines.json'), 200));
        const response = TestModels.newsResponse;
        // act
        final result = await apiService.getTopHeadlineNews();
        // assert
        expect(result, response);
      },
    );

    test(
      'throws exception '
      'when statusCode is not 200',
      () async {
        // arrange
        when(() => client.get(Uri.parse(
                'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=31b1d418811249f0970f756bca4cf906')))
            .thenAnswer(
                (_) async => Response(readJson('dummy_data/error.json'), 404));
        // act
        final call = apiService.getTopHeadlineNews();
        // assert
        expect(() => call, throwsA(isA<ServerException>()));
      },
    );
  });
}

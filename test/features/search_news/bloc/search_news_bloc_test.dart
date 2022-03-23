import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tech_crunch_news/features/search_news/bloc/search_news_bloc.dart';
import 'package:tech_crunch_news/features/search_news/bloc/search_news_event.dart';
import 'package:tech_crunch_news/features/search_news/bloc/search_news_state.dart';
import 'package:tech_crunch_news/repositories/news_repository/news_repository.dart';
import 'package:tech_crunch_news/utils/exceptions.dart';

import '../../../helpers/models.dart';

class MockRepository extends Mock implements NewsRepository {}

void main() {
  group('SearchNewsBloc', () {
    late NewsRepository repository;
    late SearchNewsBloc bloc;

    const articleList = [TestModels.article];
    const query = 'Bitcoin';

    final exception = Exception('Error!');
    const serverException = ServerException();

    setUp(() {
      repository = MockRepository();
      bloc = SearchNewsBloc(newsRepository: repository);
    });

    test('initial state is SearchLoadingState', () {
      expect(bloc.state, const SearchLoadingState());
    });

    blocTest<SearchNewsBloc, SearchNewsState>(
      'emits SearchSuccessState '
      'when SearchByKeywordsEvent is added '
      'and return list of articles',
      setUp: () {
        when(() => repository.searchNews(query: query))
            .thenAnswer((_) async => articleList);
      },
      build: () => bloc,
      act: (bloc) => bloc.add(const SearchByKeywordsEvent(keyword: query)),
      expect: () => [
        const SearchLoadingState(),
        const SearchSuccessState(articleList),
      ],
      verify: (_) {
        verify(() => repository.searchNews(query: query)).called(1);
      },
    );

    blocTest<SearchNewsBloc, SearchNewsState>(
      'emits SearchEmptyState '
      'when SearchByKeywordsEvent is added '
      'and return empty list',
      setUp: () {
        when(() => repository.searchNews(query: query))
            .thenAnswer((_) async => []);
      },
      build: () => bloc,
      act: (bloc) => bloc.add(const SearchByKeywordsEvent(keyword: query)),
      expect: () => [
        const SearchLoadingState(),
        const SearchEmptyState(),
      ],
      verify: (_) {
        verify(() => repository.searchNews(query: query)).called(1);
      },
    );

    blocTest<SearchNewsBloc, SearchNewsState>(
      'emits SearchErrorState '
      'when SearchByKeywordsEvent is added '
      'and thrown an exception',
      setUp: () {
        when(() => repository.searchNews(query: query)).thenThrow(exception);
      },
      build: () => bloc,
      act: (bloc) => bloc.add(const SearchByKeywordsEvent(keyword: query)),
      expect: () => [
        const SearchLoadingState(),
        SearchErrorState(exception.toString()),
      ],
      verify: (_) {
        verify(() => repository.searchNews(query: query)).called(1);
      },
    );

    blocTest<SearchNewsBloc, SearchNewsState>(
      'emits SearchErrorState '
      'when SearchByKeywordsEvent is added '
      'and thrown a server exception',
      setUp: () {
        when(() => repository.searchNews(query: query))
            .thenThrow(serverException);
      },
      build: () => bloc,
      act: (bloc) => bloc.add(const SearchByKeywordsEvent(keyword: query)),
      expect: () => [
        const SearchLoadingState(),
        SearchErrorState(serverException.message),
      ],
      verify: (_) {
        verify(() => repository.searchNews(query: query)).called(1);
      },
    );
  });
}

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tech_crunch_news/features/article_list/bloc/article_list_bloc.dart';
import 'package:tech_crunch_news/features/article_list/bloc/article_list_event.dart';
import 'package:tech_crunch_news/features/article_list/bloc/article_list_state.dart';
import 'package:tech_crunch_news/repositories/news_repository/news_repository.dart';

import '../../../helpers/models.dart';

class MockRepository extends Mock implements NewsRepository {}

void main() {
  group('ArticleListBloc', () {
    late NewsRepository repository;
    late ArticleListBloc bloc;

    final articleList = [TestModels.article];

    setUp(() {
      repository = MockRepository();
      bloc = ArticleListBloc(repository: repository);
    });

    tearDown(() {
      verifyNoMoreInteractions(repository);
    });

    test('initial state is ArticleListLoadingState', () {
      expect(bloc.state, const ArticleListLoadingState());
    });

    blocTest<ArticleListBloc, ArticleListState>(
      'emits ArticleListLoadSuccessState '
      'when LoadArticleListEvent is added '
      'and response success',
      setUp: () {
        when(() => repository.getTopHeadlineNews())
            .thenAnswer((_) async => articleList);
      },
      build: () => bloc,
      act: (bloc) => bloc.add(const LoadArticleListEvent()),
      expect: () => [
        const ArticleListLoadingState(),
        ArticleListLoadSuccessState(articles: articleList),
      ],
      verify: (_) {
        verify(() => repository.getTopHeadlineNews()).called(1);
      },
    );

    final exception = Exception('Error!');

    blocTest<ArticleListBloc, ArticleListState>(
      'emits ArticleListLoadErrorState '
      'when LoadArticleListEvent is added '
      'and exception is thrown',
      setUp: () {
        when(() => repository.getTopHeadlineNews()).thenThrow(exception);
      },
      build: () => bloc,
      act: (bloc) => bloc.add(const LoadArticleListEvent()),
      expect: () => [
        const ArticleListLoadingState(),
        ArticleListLoadErrorState(exception.toString()),
      ],
      verify: (_) {
        verify(() => repository.getTopHeadlineNews()).called(1);
      },
    );
  });
}

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tech_crunch_news/features/article_list/view/article_list_loading_view.dart';
import 'package:tech_crunch_news/features/search_news/bloc/search_news_bloc.dart';
import 'package:tech_crunch_news/features/search_news/bloc/search_news_event.dart';
import 'package:tech_crunch_news/features/search_news/bloc/search_news_state.dart';
import 'package:tech_crunch_news/features/search_news/models/search_news_keys.dart';
import 'package:tech_crunch_news/features/search_news/view/search_news_page.dart';

import '../../../helpers/models.dart';

class MockSearchNewsBloc extends MockBloc<SearchNewsEvent, SearchNewsState>
    implements SearchNewsBloc {}

void main() {
  group('SearchNewsPage', () {
    late SearchNewsBloc searchNewsBloc;

    const articles = [TestModels.article];

    setUp(() {
      searchNewsBloc = MockSearchNewsBloc();
    });

    Widget _buildBlocProvider({required Widget child}) {
      return BlocProvider.value(
        value: searchNewsBloc,
        child: child,
      );
    }

    testWidgets(
      'renders list of articles '
      'when state is SearchSuccessState',
      (tester) async {
        when(() => searchNewsBloc.state)
            .thenReturn(const SearchSuccessState(articles));

        await tester.pumpWidget(
          MaterialApp(
            home: _buildBlocProvider(
              child: const SearchNewsView(),
            ),
          ),
        );

        await tester.pump();

        expect(find.byKey(SearchNewsKeys.newsListView), findsOneWidget);
      },
    );

    testWidgets(
      'renders loading view '
      'when state is SearchLoadingState',
      (tester) async {
        when(() => searchNewsBloc.state).thenReturn(const SearchLoadingState());

        await tester.pumpWidget(
          MaterialApp(
            home: _buildBlocProvider(
              child: const SearchNewsView(),
            ),
          ),
        );

        await tester.pump();

        expect(find.byType(ArticleListLoadingView), findsOneWidget);
      },
    );

    testWidgets(
      'renders error message text '
      'when state is SearchErrorState',
      (tester) async {
        when(() => searchNewsBloc.state)
            .thenReturn(const SearchErrorState('error'));

        await tester.pumpWidget(
          MaterialApp(
            home: _buildBlocProvider(
              child: const SearchNewsView(),
            ),
          ),
        );

        await tester.pump();

        expect(find.byKey(SearchNewsKeys.errorMessageText), findsOneWidget);
      },
    );

    testWidgets(
      'renders empty message text '
      'when state is SearchEmptyState',
      (tester) async {
        when(() => searchNewsBloc.state).thenReturn(const SearchEmptyState());

        await tester.pumpWidget(
          MaterialApp(
            home: _buildBlocProvider(
              child: const SearchNewsView(),
            ),
          ),
        );

        await tester.pump();

        expect(find.byKey(SearchNewsKeys.emptyMessageText), findsOneWidget);
      },
    );
  });
}

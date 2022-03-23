import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tech_crunch_news/features/article_list/bloc/article_list_bloc.dart';
import 'package:tech_crunch_news/features/article_list/bloc/article_list_event.dart';
import 'package:tech_crunch_news/features/article_list/bloc/article_list_state.dart';
import 'package:tech_crunch_news/features/article_list/models/article_list_keys.dart';
import 'package:tech_crunch_news/features/article_list/view/article_list_loading_view.dart';
import 'package:tech_crunch_news/features/article_list/view/article_list_view.dart';

import '../../../helpers/models.dart';

class MockArticleListBloc extends MockBloc<ArticleListEvent, ArticleListState>
    implements ArticleListBloc {}

void main() {
  group('ArticleListPage', () {
    late ArticleListBloc articleListBloc;

    const articles = [TestModels.article];

    setUp(() {
      articleListBloc = MockArticleListBloc();
    });

    Widget _buildBlocProvider({required Widget child}) {
      return BlocProvider.value(
        value: articleListBloc,
        child: child,
      );
    }

    testWidgets(
      'renders list of articles '
      'when state is ArticleListLoadSuccessState',
      (tester) async {
        when(() => articleListBloc.state)
            .thenReturn(const ArticleListLoadSuccessState(articles: articles));

        await tester.pumpWidget(
          MaterialApp(
            home: _buildBlocProvider(
              child: const ArticleListView(),
            ),
          ),
        );

        await tester.pump();

        expect(find.byKey(ArticleListKeys.newsListView), findsOneWidget);
      },
    );

    testWidgets(
      'renders loading view '
      'when state is ArticleListLoadingState',
      (tester) async {
        when(() => articleListBloc.state)
            .thenReturn(const ArticleListLoadingState());

        await tester.pumpWidget(
          MaterialApp(
            home: _buildBlocProvider(
              child: const ArticleListView(),
            ),
          ),
        );

        await tester.pump();

        expect(find.byType(ArticleListLoadingView), findsOneWidget);
      },
    );

    testWidgets(
      'renders error message text '
      'when state is ArticleListLoadErrorState',
      (tester) async {
        when(() => articleListBloc.state)
            .thenReturn(const ArticleListLoadErrorState('error'));

        await tester.pumpWidget(
          MaterialApp(
            home: _buildBlocProvider(
              child: const ArticleListView(),
            ),
          ),
        );

        await tester.pump();

        expect(find.byKey(ArticleListKeys.errorMessageText), findsOneWidget);
      },
    );
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_crunch_news/features/article_list/bloc/article_list_bloc.dart';
import 'package:tech_crunch_news/features/article_list/bloc/article_list_state.dart';
import 'package:tech_crunch_news/features/article_list/view/article_list_loading_view.dart';
import 'package:tech_crunch_news/features/article_list/widgets/news_card.dart';
import 'package:tech_crunch_news/theme/typography.dart';
import 'package:tech_crunch_news/widgets/news_animated_switcher.dart';

class ArticleListItemView extends StatelessWidget {
  const ArticleListItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleListBloc, ArticleListState>(
      builder: (context, state) {
        return NewsAnimatedSwitcher(
          child: Builder(
            key: UniqueKey(),
            builder: (context) {
              if (state is ArticleListLoadErrorState) {
                return SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Center(
                      child: Text(
                        state.message,
                        style: Theme.of(context).textTheme.display,
                      ),
                    ),
                  ),
                );
              } else if (state is ArticleListLoadSuccessState) {
                return SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final article = state.articles[index];

                        return NewsCard(article: article);
                      },
                      childCount: state.articles.length,
                    ),
                  ),
                );
              } else {
                return const SliverToBoxAdapter(
                  child: ArticleListLoadingView(),
                );
              }
            },
          ),
        );
      },
    );
  }
}

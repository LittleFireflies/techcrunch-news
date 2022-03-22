import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_crunch_news/features/article_list/bloc/article_list_event.dart';
import 'package:tech_crunch_news/features/article_list/bloc/article_list_state.dart';
import 'package:tech_crunch_news/repositories/news_repository/news_repository.dart';
import 'package:tech_crunch_news/utils/exceptions.dart';

class ArticleListBloc extends Bloc<ArticleListEvent, ArticleListState> {
  final NewsRepository _repository;

  ArticleListBloc({required NewsRepository repository})
      : _repository = repository,
        super(const ArticleListLoadingState()) {
    on<LoadArticleListEvent>((event, emit) async {
      emit(const ArticleListLoadingState());

      try {
        final articles = await _repository.getTopHeadlineNews();
        emit(ArticleListLoadSuccessState(articles: articles));
      } on ServerException catch (e) {
        emit(ArticleListLoadErrorState(e.message));
      } catch (e) {
        emit(ArticleListLoadErrorState(e.toString()));
      }
    });
  }
}

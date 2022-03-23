import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_crunch_news/features/search_news/bloc/search_news_event.dart';
import 'package:tech_crunch_news/features/search_news/bloc/search_news_state.dart';
import 'package:tech_crunch_news/repositories/news_repository/news_repository.dart';
import 'package:tech_crunch_news/utils/exceptions.dart';

class SearchNewsBloc extends Bloc<SearchNewsEvent, SearchNewsState> {
  final NewsRepository _repository;

  SearchNewsBloc({required NewsRepository newsRepository})
      : _repository = newsRepository,
        super(const SearchLoadingState()) {
    on<SearchByKeywordsEvent>((event, emit) async {
      emit(const SearchLoadingState());

      try {
        final articles = await _repository.searchNews(query: event.keyword);

        if (articles.isNotEmpty) {
          emit(SearchSuccessState(articles));
        } else {
          emit(const SearchEmptyState());
        }
      } on ServerException catch (e) {
        emit(SearchErrorState(e.message));
      } catch (e) {
        emit(SearchErrorState(e.toString()));
      }
    });
  }
}

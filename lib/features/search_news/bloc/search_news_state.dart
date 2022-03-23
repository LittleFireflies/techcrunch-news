import 'package:equatable/equatable.dart';
import 'package:tech_crunch_news/repositories/models/article.dart';

abstract class SearchNewsState extends Equatable {
  const SearchNewsState();
}

class SearchLoadingState extends SearchNewsState {
  const SearchLoadingState();

  @override
  List<Object?> get props => [];
}

class SearchSuccessState extends SearchNewsState {
  final List<Article> articles;

  const SearchSuccessState(this.articles);

  @override
  List<Object?> get props => [articles];
}

class SearchEmptyState extends SearchNewsState {
  const SearchEmptyState();

  @override
  List<Object?> get props => [];
}

class SearchErrorState extends SearchNewsState {
  final String message;

  const SearchErrorState(this.message);

  @override
  List<Object?> get props => [message];
}

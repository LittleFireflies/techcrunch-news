import 'package:equatable/equatable.dart';

abstract class SearchNewsEvent extends Equatable {
  const SearchNewsEvent();
}

class SearchByKeywordsEvent extends SearchNewsEvent {
  final String keyword;

  const SearchByKeywordsEvent({required this.keyword});

  @override
  List<Object?> get props => [keyword];
}

/*part of 'search_results_cubit.dart';

@immutable
abstract class SearchResultsState {}

class SearchResultsInitial extends SearchResultsState {}*/

part of 'search_results_cubit.dart';

sealed class SearchResultsState {}

class InitialState extends SearchResultsState {}
class LoadingState extends SearchResultsState {
  final String loadingText;
  LoadingState({required this.loadingText});
}
class LoadedState extends SearchResultsState {
  final List<SearchResultDTO> results;
  LoadedState({required this.results});
}
class ErrorState extends SearchResultsState {}
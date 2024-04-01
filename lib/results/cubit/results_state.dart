part of 'results_cubit.dart';

sealed class ResultState {}

class InitialState extends ResultState {}
class LoadingState extends ResultState {
  final String loadingText;
  LoadingState({required this.loadingText});
}
class LoadedState<T extends ResultDTO> extends ResultState {
  final List<T> items;
  LoadedState({required this.items});
}
class ErrorState extends ResultState {}

class GetResultsState extends ResultState {
  final String suggestionText;
  GetResultsState({required this.suggestionText});
}
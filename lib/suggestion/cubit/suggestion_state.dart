part of 'suggestion_cubit.dart';

sealed class SuggestionState {}

class InitialState extends SuggestionState {}
class LoadingState extends SuggestionState {
  final String loadingText;
  LoadingState({required this.loadingText});
}
class LoadedState extends SuggestionState {
  final List<SuggestionDTO> results;
  LoadedState({required this.results});
}
class ErrorState extends SuggestionState {}

class ClickSuggestionState extends SuggestionState {
  final SuggestionDTO suggestion;
  ClickSuggestionState({required this.suggestion});
}


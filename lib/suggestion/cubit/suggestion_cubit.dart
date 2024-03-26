import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import '../../api_layer/base_service.dart';
import '../../api_layer/itunes_search_api_response.dart';
import '../suggestion.dart';

part 'suggestion_state.dart';
part 'suggestion_repository.dart';

class SuggestionCubit extends Cubit<SuggestionState> {
  final SuggestionRepository suggestionRepository;
  SuggestionCubit(this.suggestionRepository) : super(InitialState());

  retrieveSuggestionsFor({required String queryText}) async {
    emit(LoadingState(loadingText: "Retrieve the results..."));
    try {
      List<Response> responses = await suggestionRepository.retrieveSuggestionsFor(searchQuery: queryText);
      List<SuggestionDTO> results = responses.expand((response) {
        ItunesSearchAPIResponse responseData = response.data;
        return responseData.results.map((data) => SuggestionDTO.fromJson(data));
      }).toList();
      final keys = <dynamic>{};
      results.retainWhere((x) => keys.add(x.suggestionString));
      emit(LoadedState(results: results));
    } catch (error) {
      emit(ErrorState());
    }
  }
}
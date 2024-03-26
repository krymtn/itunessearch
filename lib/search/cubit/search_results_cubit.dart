import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itunessearchbloc/api_layer/itunes_search_api_response.dart';
import '../search_repository.dart';
part 'search_results_state.dart';

class SearchResultCubit extends Cubit<SearchResultsState> {
  final SearchRepository searchRepository;
  SearchResultCubit(this.searchRepository) : super(InitialState());

  fetchResultsBy({required String queryText}) async {
    emit(LoadingState(loadingText: "Retrieve the results..."));
    try {
      List<Response> responses = await searchRepository.fetchResultsBy(searchQuery: queryText);
      List<String?> results = responses.expand((response) {
        ItunesSearchAPIResponseData responseData = response.data;
        return responseData.results.map((e) => e.searchValue).toList();
      }).toSet().toList();
      emit(LoadedState(results: results));
    } catch (error) {
      emit(ErrorState());
    }
  }
}

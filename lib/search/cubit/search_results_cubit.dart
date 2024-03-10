import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itunessearchbloc/api_layer/itunes_search_api_response.dart';
import '../models/search_result_dto.dart';
import '../search_repository.dart';
part 'search_results_state.dart';

class SearchResultCubit extends Cubit<SearchResultsState> {
  final SearchRepository searchRepository;
  SearchResultCubit(this.searchRepository) : super(InitialState());

  fetchResultsBy({required String queryText}) async {
    emit(LoadingState(loadingText: "Retrieve the results..."));
    try {
      Response response = await searchRepository.fetchResultsBy(searchQuery: queryText);
      ItunesSearchAPIResponseData responseData = response.data;
      emit(LoadedState(results: responseData.results));
    } catch (error) {
      emit(ErrorState());
    }
  }
}

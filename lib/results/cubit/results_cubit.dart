import 'package:flutter_bloc/flutter_bloc.dart';
import '../../api_layer/api_layer.dart';
import '../../api_layer/base_service.dart';
import '../models/models.dart';

part 'results_state.dart';
part 'results_repository.dart';

class ResultsCubit extends Cubit<ResultState> {
  final ResultsRepository repository;

  ResultsCubit(this.repository) : super(InitialState());

  prepareSection({required Entities entity, required String queryText}) async {
    emit(LoadingState(loadingText: "Retrieve the results..."));
    try {
      Response response = await repository.fetchOverviewSearchItemsBy(entity: entity, queryText: queryText);
      ItunesSearchAPIResponse responseData = response.data;
      switch(entity) {
        case Entities.song:
          break;
        case Entities.album:
          List<Album> albums = responseData.results.map((albumData) => Album.fromJson(albumData)).toList();
          emit(LoadedState<Album>(items: albums));
        case Entities.musicVideo:
          List<MusicVideo> videos = responseData.results.map((musicVideoData) => MusicVideo.fromJson(musicVideoData)).toList();
          emit(LoadedState<MusicVideo>(items: videos));
      }
    } catch (error) {
      emit(ErrorState());
    }
  }
}
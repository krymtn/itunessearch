import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itunessearchbloc/results/widgets/album_cell.dart';
import 'package:itunessearchbloc/results/widgets/song_cell.dart';
import 'package:itunessearchbloc/results/widgets/video_cell.dart';
import '../cubit/results_cubit.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class ResultsPage extends StatelessWidget {
  final String queryString;
  final ResultsRepository? repository;
  const ResultsPage({super.key, this.repository, required this.queryString});

  ResultsRepository get _repository => repository ?? ResultsRepository();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        BlocProvider(
            create: (context) => ResultsCubit(_repository)..prepareSection(entity: Entities.song, queryText: queryString),
            child: BlocBuilder<ResultsCubit, ResultState>(
                builder: (context, state) {
                  return switch (state) {
                    InitialState() => Container(),
                    LoadingState(loadingText: String text) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator.adaptive(),
                        const SizedBox(height: 16),
                        Text(text),
                      ],
                    ),
                    LoadedState<Song>(items: List<Song> songs) => ResultSection(
                        title: "Songs",
                        sectionBuilder: (context, index) {
                          var list = songs.sublist(index*4, (index*4)+4);
                          return SizedBox(
                              width: 300,
                              height: 200,
                              child: SongCell(songs: list));
                        }, itemCount: songs.length ~/ 4),
                    ErrorState() => Container(),
                    LoadedState<ResultDTO>() => const SizedBox(),
                    GetResultsState() => const SizedBox(),
                  };
                }
            )
        ),
        BlocProvider(
            create: (context) => ResultsCubit(_repository)..prepareSection(entity: Entities.album, queryText: queryString),
            child: BlocBuilder<ResultsCubit, ResultState>(
              builder: (context, state) {
                return switch (state) {
                  InitialState() => Container(),
                  LoadingState(loadingText: String text) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator.adaptive(),
                      const SizedBox(height: 16),
                      Text(text),
                    ],
                  ),
                  LoadedState<Album>(items: List<Album> albums) => ResultSection(
                      title: "Albums",
                      sectionBuilder: (context , index) {
                        return AlbumCell(item: albums[index]);
                      }, itemCount: albums.length),
                  ErrorState() => Container(),
                  LoadedState<ResultDTO>() => const SizedBox(),
                  GetResultsState() => const SizedBox(),
                };
              }
            )
        ),
        BlocProvider(
            create: (context) => ResultsCubit(_repository)..prepareSection(entity: Entities.musicVideo, queryText: queryString),
            child: BlocBuilder<ResultsCubit, ResultState>(
                builder: (context, state) {
                  return switch (state) {
                    InitialState() => Container(),
                    LoadingState(loadingText: String text) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator.adaptive(),
                        const SizedBox(height: 16),
                        Text(text),
                      ],
                    ),
                    LoadedState<MusicVideo>(items: List<MusicVideo> videos) => ResultSection(
                        title: "Music Videos",
                        sectionBuilder: (context , index) {
                          return VideoCell(item: videos[index]);
                        }, itemCount: videos.length),
                    ErrorState() => Container(),
                    LoadedState<ResultDTO>() => const SizedBox(),
                    GetResultsState() => const SizedBox(),
                  };
                }
            )
        ),
      ],
    );
  }
}
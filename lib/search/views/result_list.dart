import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itunessearchbloc/search/models/search_result_dto.dart';
import '../cubit/search_results_cubit.dart';

class ResultListView extends StatelessWidget {
  const ResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SearchResultCubit>().fetchResultsBy(queryText: "jack+johnson");
    return Scaffold(
      body: Center(
        child: BlocBuilder<SearchResultCubit, SearchResultsState>(
          builder: (context, state) {
            return switch (state) {
              InitialState() => const Text("Initial State is here"),
              LoadingState(loadingText: String text) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircularProgressIndicator.adaptive(),
                  const SizedBox(height: 16),
                  Text(text),
                ],
              ),
              LoadedState(results: List<SearchResultDTO> results) => ListView.separated(
                  shrinkWrap: true,
                  itemCount: results.length,
                  separatorBuilder: (BuildContext context, int index) => const SizedBox(),
                  itemBuilder: (BuildContext context, int index) {
                    var item = results[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 8.0, bottom: 8.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Artist: ${item.artistName}"),
                              const SizedBox(height: 4),
                              Text("Collection: ${item.collectionName}"),
                              const SizedBox(height: 4),
                              Text("Track: ${item.trackName}"),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
              ErrorState() => Container(),
            };
          },
        ),
      ),
    );
  }
}

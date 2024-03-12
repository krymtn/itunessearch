import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/search_results_cubit.dart';

class ResultList extends StatelessWidget {
  const ResultList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<SearchResultCubit, SearchResultsState>(
          builder: (context, state) {
            return switch (state) {
              InitialState() => const Text("Search albums,songs,artists"),
              LoadingState(loadingText: String text) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircularProgressIndicator.adaptive(),
                  const SizedBox(height: 16),
                  Text(text),
                ],
              ),
              LoadedState(results: List<String?> results) => ListView.builder(
                  shrinkWrap: true,
                  itemCount: results.length,
                  itemBuilder: (BuildContext context, int index) {
                    var item = results[index];
                     return (item == null) ?const SizedBox() :Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item),
                          const Divider(),
                        ],
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

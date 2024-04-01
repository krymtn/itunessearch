import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../suggestion.dart';


class SuggestionPage extends StatelessWidget {
  const SuggestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuggestionCubit, SuggestionState>(
        builder: (context, state) {
          return switch (state) {
            InitialState() => const PopularKeywords(),
            LoadingState(loadingText: String text) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircularProgressIndicator.adaptive(),
                const SizedBox(height: 16),
                Text(text),
              ],
            ),
            LoadedState(results: List<SuggestionDTO> results) => SuggestionList(didSelect: (suggestion) {
              context.read<SuggestionCubit>().clickSuggestion(suggestion);
            }, suggestions: results),
            ClickSuggestionState() ||
            ErrorState() => Container(),

          };
        });
  }
}

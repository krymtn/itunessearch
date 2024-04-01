import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../suggestion.dart';


class SuggestionPage extends StatefulWidget {
  const SuggestionPage({super.key});

  @override
  State<SuggestionPage> createState() => _SuggestionPageState();
}

class _SuggestionPageState extends State<SuggestionPage> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SuggestionCubit, SuggestionState>(
      listener: (context, state) {
        if (state is InitialState) {
          _pageController.jumpToPage(0);
        }
        if (state is LoadingState) {
          _pageController.jumpToPage(1);
        }
      },
      listenWhen: (oldState, newState) {
        return (oldState is InitialState && newState is LoadingState) || (oldState is LoadedState && newState is InitialState);
      },
      child: PageView(
        controller: _pageController,
        children: [
          const PopularKeywords(),
          BlocBuilder<SuggestionCubit, SuggestionState>(
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
                  LoadedState(results: List<SuggestionDTO> results) => SuggestionList(didSelect: (suggestion) {
                    context.read<SuggestionCubit>().clickSuggestion(suggestion);
                  }, suggestions: results),
                  ErrorState() => Container(),
                  ClickSuggestionState() => Container(),
                };
              })
        ],
      ),
    );
  }
}

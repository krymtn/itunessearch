import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itunessearchbloc/results/cubit/results_cubit.dart';
import 'base_widget.dart';
import 'debouncer.dart';
import 'results/view/view.dart';
import 'suggestion/suggestion.dart';
import 'search_view.dart';

class RootView extends StatefulWidget {
  final ResultsRepository? resultsRepository;
  final SuggestionRepository? suggestionRepository;
  const RootView({super.key, this.suggestionRepository, this.resultsRepository});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  final SearchController searchController = SearchController();
  final debouncer = Debouncer(milliseconds: 1000);

  late SuggestionCubit suggestionCubit;
  SuggestionRepository get _suggestionRepository => widget.suggestionRepository ?? SuggestionRepository();
  late ResultsCubit resultsCubit;
  ResultsRepository get _resultsRepository => widget.resultsRepository ?? ResultsRepository();

  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    suggestionCubit = SuggestionCubit(_suggestionRepository);
    resultsCubit = ResultsCubit(_resultsRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(builder: (context, constraints) {
      return MultiBlocProvider(
          providers: [
            BlocProvider<SuggestionCubit>(create: (context) => suggestionCubit),
            BlocProvider<ResultsCubit>(create: (context) => resultsCubit),
          ],
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: SearchBarView(
                          searchController: searchController, onChanged: onChanged, onSubmitted: onSubmitted, onCancelPressed: onCancelPressed),
                    ),
                    TextButton(onPressed: onCancelPressed, child: const Text("Cancel")),
                  ],
                ),
              ),
              Expanded(
                child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _pageController,
                    children: [
                      BlocConsumer<SuggestionCubit, SuggestionState>(
                          builder: (context, state) {
                            return const SuggestionPage();
                          },
                          listener: (context, state) {
                            if (state is ClickSuggestionState) {
                              _pageController.jumpToPage(1);
                              resultsCubit.getTheResults(query: state.suggestion.suggestionString!);
                            } else {
                              _pageController.jumpToPage(0);
                            }
                          }
                      ),
                      BlocConsumer<ResultsCubit, ResultState>(
                          builder: (context, state) {
                            if (state is GetResultsState) {
                              return ResultsPage(queryString: state.suggestionText);
                            }
                            return const SizedBox.shrink();
                          },
                          listener: (context, state) {}
                      ),
                     ]),
              )
            ],
          ));
    });
  }
  final ValueNotifier<String?> searchString = ValueNotifier<String?>(null);
  void onCancelPressed() {
    _pageController.jumpToPage(0);
    searchController.clear();
    suggestionCubit.clear();
  }

  void onChanged(String text) {
    debouncer.run(() {
      if (text.length > 3) {
        _pageController.jumpToPage(0);
        suggestionCubit.clear();
        suggestionCubit.retrieveSuggestionsFor(queryText: text);
      } else if (text.isEmpty) {
        suggestionCubit.clear();
      }
    });
  }

  void onSubmitted(String option) {
    resultsCubit.getTheResults(query: option);
    _pageController.jumpToPage(1);
  }
}

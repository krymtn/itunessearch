import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itunessearchbloc/base_widget.dart';
import 'debouncer.dart';
import 'suggestion/suggestion.dart';
import 'search_view.dart';

class RootView extends StatefulWidget {
  final SuggestionRepository? suggestionRepository;
  const RootView({super.key, this.suggestionRepository});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  final SearchController searchController = SearchController();
  final debouncer = Debouncer(milliseconds: 500);

  late SuggestionCubit suggestionCubit;

  SuggestionRepository get _suggestionRepository =>
      widget.suggestionRepository ?? SuggestionRepository();

  @override
  void initState() {
    suggestionCubit = SuggestionCubit(_suggestionRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(builder: (context, constraints) {
      return MultiBlocProvider(
          providers: [
            BlocProvider<SuggestionCubit>(create: (context) => suggestionCubit),
          ],
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: SearchBarView(
                          searchController: searchController,
                          onChanged: onChanged,
                          onSubmitted: onSubmitted,
                          onCancelPressed: onCancelPressed),
                    ),
                    TextButton(onPressed: onCancelPressed, child: const Text("Cancel")),
                  ],
                ),
              ),
              const Expanded(child: SuggestionPage()),
            ],
          ));
    });
  }

  void onCancelPressed() {
    searchController.clear();
    suggestionCubit.clear();
  }

  void onChanged(String text) {
    debouncer.run(() {
      if (text.length > 3) {
        suggestionCubit.retrieveSuggestionsFor(queryText: text);
      } else if (text.isEmpty) {
        suggestionCubit.clear();
      }
    });
  }

  void onSubmitted(String query) {}
}

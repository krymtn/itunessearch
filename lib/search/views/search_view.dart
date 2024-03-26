import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itunessearchbloc/base_widget.dart';
import '../../debouncer.dart';
import '../../suggestion/suggestion.dart';

class SearchView extends BaseStatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends BaseStatefulWidgetState<SearchView> with BaseStatefulWidgetMixin {
  final TextEditingController controller = TextEditingController();
  final debouncer = Debouncer(milliseconds: 500);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onChanged(String text) {
    debouncer.run(() {
      context.read<SuggestionCubit>().retrieveSuggestionsFor(queryText: text);
    });
  }

  void onSubmitted(String query) {}
  
  @override
  Widget get child => Column(
    children: [
      Container(
        color: Colors.grey.shade200,
        child: SearchBar(
          controller: controller,
          leading: const Icon(Icons.search_rounded),
          side: const MaterialStatePropertyAll(BorderSide(style: BorderStyle.none)),
          // trailing: [(controller.text.isNotEmpty) ?Icon(Icons.cancel_outlined) :SizedBox()],
          hintText: "Search...",
          elevation: const MaterialStatePropertyAll(0.0),
          backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
          overlayColor: const MaterialStatePropertyAll(Colors.transparent),
          onChanged: onChanged,
          onSubmitted: onSubmitted,
        ),
      ),
      Expanded(
          child: BlocBuilder<SuggestionCubit, SuggestionState>(
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
                LoadedState(results: List<SuggestionDTO> results) => SuggestionList(suggestions: results),
                ErrorState() => Container(),
              };
            })
      ),
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'suggestion/suggestion.dart';
import 'base_widget.dart';
import 'search/views/search_view.dart';


class RootView extends BaseStatelessWidget {
  final SuggestionRepository? suggestionRepository;
  const RootView({super.key, this.suggestionRepository});
  SuggestionRepository get _suggestionRepository => suggestionRepository ?? SuggestionRepository();

  @override
  Widget get child => BlocProvider(
    create: (context) => SuggestionCubit(_suggestionRepository),
    child: const SearchView(),
  );
}

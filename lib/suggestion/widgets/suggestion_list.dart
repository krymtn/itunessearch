import 'package:flutter/material.dart';
import '../suggestion.dart';

class SuggestionList extends StatelessWidget {
  final List<SuggestionDTO> suggestions;
  const SuggestionList({super.key, required this.suggestions});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return SuggestionCell(suggestion: suggestions[index]);
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (BuildContext context, int index) {
          return SuggestionCell(suggestion: suggestions[index]);
        });
  }
}

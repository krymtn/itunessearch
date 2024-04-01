import 'package:flutter/material.dart';
import '../suggestion.dart';

class SuggestionList extends StatelessWidget {
  final List<SuggestionDTO> suggestions;
  final Function(SuggestionDTO) didSelect;
  const SuggestionList({super.key, required this.suggestions, required this.didSelect});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        SuggestionDTO dto = suggestions[index];
        return GestureDetector(onTap: () {
          didSelect(dto);
        }, child: SuggestionCell(suggestion: dto));
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );
  }
}

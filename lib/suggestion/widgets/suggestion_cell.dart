import 'package:flutter/material.dart';
import '../suggestion.dart';

class SuggestionCell extends StatelessWidget {
  final Suggestion suggestion;
  const SuggestionCell({super.key, required this.suggestion});

  @override
  Widget build(BuildContext context) {
    return (suggestion.suggestionString == null)
        ? const SizedBox()
        : ListTile(title: Text(suggestion.suggestionString!));
  }
}

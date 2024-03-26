import 'package:flutter/material.dart';
import '../suggestion.dart';

class SuggestionCell extends StatelessWidget {
  final Suggestion suggestion;
  const SuggestionCell({super.key, required this.suggestion});

  @override
  Widget build(BuildContext context) {
    return (suggestion.suggestionString == null)
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(suggestion.suggestionString!),
                const Divider(),
              ],
            ),
          );
  }
}

import 'package:flutter/material.dart';

class SearchBarView extends StatelessWidget {
  final SearchController searchController;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final Function() onCancelPressed;
  const SearchBarView(
      {super.key,
      required this.onChanged,
      required this.onSubmitted,
      required this.searchController,
      required this.onCancelPressed});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      leading: const Icon(Icons.search_outlined, size: 24),
      hintText: "Search",
      controller: searchController,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      //trailing: [(searchController.text.isNotEmpty) ?IconButton(icon: const Icon(Icons.cancel), onPressed: onCancelPressed): SizedBox()],
    );
  }
}

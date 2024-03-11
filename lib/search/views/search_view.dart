import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itunessearchbloc/base_widget.dart';
import 'package:itunessearchbloc/search/views/result_list.dart';
import '../cubit/search_results_cubit.dart';

class SearchView extends BaseStatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends BaseStatefulWidgetState<SearchView> with BaseStatefulWidgetMixin{

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SearchResultCubit>().fetchResultsBy(queryText: "jack+johnson");
    });
  }
  
  @override
  Widget get child => const Column(
    children: [
      SearchBar(
        leading: Icon(Icons.search_outlined),
        hintText: "Search",
      ),
      Expanded(child: ResultList()),
    ],
  );
}

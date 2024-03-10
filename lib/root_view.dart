import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'base_widget.dart';
import 'search/cubit/search_results_cubit.dart';
import 'search/views/result_list.dart';
import 'search/search_repository.dart';


class RootView extends BaseStatelessWidget {
  final SearchRepository? searchRepository;
  const RootView({super.key, this.searchRepository});
  SearchRepository get _searchRepository => searchRepository ?? SearchRepository();

  @override
  Widget get appBarTitle => const Text("iTunes Search");

  @override
  Widget get child => BlocProvider(
    create: (context) => SearchResultCubit(_searchRepository),
    child: const ResultListView(),
  );
}

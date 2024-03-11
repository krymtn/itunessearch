import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'base_widget.dart';
import 'search/cubit/search_results_cubit.dart';
import 'search/search_repository.dart';
import 'search/views/search_view.dart';


class RootView extends BaseStatelessWidget {
  final SearchRepository? searchRepository;
  const RootView({super.key, this.searchRepository});
  SearchRepository get _searchRepository => searchRepository ?? SearchRepository();

  @override
  Widget get child => BlocProvider(
    create: (context) => SearchResultCubit(_searchRepository),
    child: const SearchView(),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itunessearchbloc/base_widget.dart';
import 'package:itunessearchbloc/search/views/result_list.dart';
import '../../debouncer.dart';
import '../cubit/search_results_cubit.dart';

class SearchView extends BaseStatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends BaseStatefulWidgetState<SearchView> with BaseStatefulWidgetMixin{
  final TextEditingController controller = TextEditingController();
  final debouncer = Debouncer(milliseconds: 750);
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SearchResultCubit>().fetchResultsBy(queryText: "jack+johnson");
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onChanged(String text) {
    debouncer.run(() {
      print("onChanged :$text");
    });
  }

  void onSubmitted(String query) {
    print("Query will be send to the next screen :$query");
  }
  
  @override
  Widget get child => Column(
    children: [
      Container(
        color: Colors.grey.shade200,
        child: SearchBar(
          controller: controller,
          leading: const Icon(Icons.search_rounded),
          side: const MaterialStatePropertyAll(BorderSide(style: BorderStyle.none)),
          trailing: [(controller.text.isNotEmpty) ?Icon(Icons.cancel_outlined) :SizedBox()],
          hintText: "Search...",
          elevation: const MaterialStatePropertyAll(0.0),
          backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
          overlayColor: const MaterialStatePropertyAll(Colors.transparent),
          onChanged: onChanged,
          onSubmitted: onSubmitted,
        ),
      ),
      const Expanded(child: ResultList()),
    ],
  );
}

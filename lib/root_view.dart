import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'debouncer.dart';
import 'suggestion/suggestion.dart';
import 'base_widget.dart';
import 'search_view.dart';


class RootView extends BaseStatelessWidget {
  final SuggestionRepository? suggestionRepository;
  RootView({super.key, this.suggestionRepository});
  SuggestionRepository get _suggestionRepository => suggestionRepository ?? SuggestionRepository();

  final TextEditingController controller = TextEditingController();
  final debouncer = Debouncer(milliseconds: 500);

  void onChanged(String text) {
    debouncer.run(() {

    });
  }

  void onSubmitted(String query) {}

  @override
  Widget? get appBarTitle => CupertinoSearchTextField(
    controller: controller,
    //leading: const Icon(Icons.search_rounded),
    //side: const MaterialStatePropertyAll(BorderSide(style: BorderStyle.none)),
    // trailing: [(controller.text.isNotEmpty) ?Icon(Icons.cancel_outlined) :SizedBox()],
    //hintText: "Search...",
    //elevation: const MaterialStatePropertyAll(0.0),
    //backgroundColor: const MaterialStatePropertyAll(Colors.black12),
    //overlayColor: const MaterialStatePropertyAll(Colors.transparent),
    onChanged: onChanged,
    onSubmitted: onSubmitted,
  );

  @override
  Widget get child => BlocProvider(
    create: (context) => SuggestionCubit(_suggestionRepository),
    child: Container(),
  );
}

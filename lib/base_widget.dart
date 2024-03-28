import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  final LayoutWidgetBuilder builder;
  final AppBar? appBar;
  const BaseScreen({super.key, required this.builder, this.appBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: LayoutBuilder(
        builder: (context, constraint) {
          return SafeArea(
              child: builder(context, constraint)
          );
        },
      ),
    );
  }
}

abstract class BaseStatefulWidget extends StatefulWidget {
  const BaseStatefulWidget({super.key});
}

abstract class BaseStatefulWidgetState<T extends BaseStatefulWidget> extends State<T> {
  Widget get child;
}

mixin BaseStatefulWidgetMixin<T extends BaseStatefulWidget> on BaseStatefulWidgetState<T> {}




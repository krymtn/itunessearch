import 'package:flutter/material.dart';

abstract class BaseStatelessWidget extends StatelessWidget {
  final Widget? appBarTitle;
  Widget get child;
  const BaseStatelessWidget({super.key, this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: appBarTitle),
      body: SafeArea(child: child),
    );
  }
}

abstract class BaseStatefulWidget extends StatefulWidget {
  const BaseStatefulWidget({super.key});
}

abstract class BaseStatefulWidgetState<T extends BaseStatefulWidget> extends State<T> {}

mixin BaseStatefulWidgetMixin<T extends BaseStatefulWidget> on BaseStatefulWidgetState<T> {}




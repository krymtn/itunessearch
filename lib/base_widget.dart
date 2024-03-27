import 'package:flutter/material.dart';

abstract class BaseStatelessWidget extends StatelessWidget {
  Widget? get appBarTitle => null;
  Widget get child;
  const BaseStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (appBarTitle == null) ?null :AppBar(title: appBarTitle, backgroundColor: Colors.grey.shade200),
      body: SafeArea(child: child),
    );
  }
}

abstract class BaseStatefulWidget extends StatefulWidget {
  const BaseStatefulWidget({super.key});
}

abstract class BaseStatefulWidgetState<T extends BaseStatefulWidget> extends State<T> {
  final Widget? appBarTitle;
  BaseStatefulWidgetState({this.appBarTitle});

  Widget get child;
}

mixin BaseStatefulWidgetMixin<T extends BaseStatefulWidget> on BaseStatefulWidgetState<T> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (appBarTitle == null) ?null :AppBar(title: appBarTitle),
      body: SafeArea(child: child),
    );
  }
}




import 'package:flutter/material.dart';
import 'root_view.dart';
import 'theme/theme.dart' as app_theme;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iTunes Search',
      theme: app_theme.lightTheme,
      home: const RootView(),
    );
  }
}

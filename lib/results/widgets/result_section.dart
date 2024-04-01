import 'package:flutter/material.dart';
import '../models/models.dart';

class ResultSection<T extends ResultDTO> extends StatelessWidget {
  final String title;
  final int? itemCount;
  final Widget Function(BuildContext, int) sectionBuilder;
  const ResultSection({super.key, required this.title, required this.sectionBuilder, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(title), TextButton(onPressed: () {}, child: const Text("See all"))]),
        Container(
          constraints: const BoxConstraints(
              minHeight: 100, maxHeight: 170),
          child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: itemCount ?? 0,
              scrollDirection: Axis.horizontal,
              itemBuilder: sectionBuilder,
              separatorBuilder: (BuildContext context, int index) {
                return const VerticalDivider(width: 16, thickness: 0, color: Colors.transparent);
              }),
        )
      ],
    );
  }
}

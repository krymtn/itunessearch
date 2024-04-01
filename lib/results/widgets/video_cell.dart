import 'package:flutter/material.dart';
import '../models/models.dart';
import 'result_cell.dart';

class VideoCell extends ResultCell<MusicVideo> {
  const VideoCell({super.key, required super.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
          maxWidth: 100
      ),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [image, track, artist]
      ),
    );
  }
}
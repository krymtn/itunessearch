import 'package:flutter/material.dart';
import '../models/models.dart';

class VideoCell extends StatelessWidget {
  final MusicVideo musicVideo;
  const VideoCell({super.key, required this.musicVideo});

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
        children: [
          Image.network(musicVideo.artworkUrl100.toString(), fit: BoxFit.fitWidth),
          Text(musicVideo.trackName.toString()),
          Text(musicVideo.artistName.toString())
        ],
      ),
    );
  }
}
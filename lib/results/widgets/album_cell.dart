import 'package:flutter/material.dart';
import '../models/models.dart';

class AlbumCell extends StatelessWidget {
  final Album album;
  const AlbumCell({super.key, required this.album});

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
          Image.network(album.artworkUrl100.toString(), fit: BoxFit.fitWidth),
          Text(album.collectionName.toString(), maxLines: 2, overflow: TextOverflow.ellipsis),
          Text(album.artistName.toString(), maxLines: 1, style: const TextStyle(fontWeight: FontWeight.w700))
        ],
      ),
    );
  }
}

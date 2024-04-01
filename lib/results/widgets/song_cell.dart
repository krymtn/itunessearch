import 'package:flutter/material.dart';
import '../models/song.dart';
import 'result_cell.dart';

class SongRow extends ResultCell<Song> {
  const SongRow({super.key, required super.item});

  @override
  Text get track => Text(item.trackName.toString(), maxLines: 1, overflow: TextOverflow.ellipsis);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        image,
        const SizedBox(width: 8),
        Expanded(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                track,
                artist
          ],
        )),
        const SizedBox(width: 8),
        price
      ],
    );
  }
}

class SongCell extends StatelessWidget {
  final List<Song> songs;
  const SongCell({super.key, required this.songs});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: songs.length,
      itemBuilder: (context, index) {
        return SizedBox(height: 40 ,child: SongRow(item: songs[index]));
      },
    );
  }
}

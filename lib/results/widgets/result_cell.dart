import 'package:flutter/material.dart';
import '../models/result_dto.dart';

abstract class ResultCell<T extends ResultDTO> extends StatelessWidget {
  final T item;
  const ResultCell({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 100),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [image, track, artist]),
    );
  }

  Image get image => Image.network(item.artworkUrl100.toString(), fit: BoxFit.fitWidth);
  Text get track => Text(item.trackName.toString(), maxLines: 2, overflow: TextOverflow.ellipsis);
  Text get artist => Text(item.artistName.toString(), maxLines: 1, style: const TextStyle(fontWeight: FontWeight.w700));
  Widget get price => (item.price != null)
      ? Container(
          width: 70,
          decoration: BoxDecoration(border: Border.all(width: 1.0, color: Colors.blue), borderRadius: const BorderRadius.all(Radius.circular(5.0))),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
            child: Text("₺${item.price}", textAlign: TextAlign.center, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w700)),
          ),
        )
      : const SizedBox.shrink();
}

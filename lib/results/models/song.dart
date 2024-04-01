import 'result_dto.dart';

class Song extends ResultDTO {
  final int trackId;
  final int collectionId;
  final String? collectionName;

  Song({
    required this.trackId,
    required this.collectionId,
    this.collectionName,
    super.trackName,
    super.price,
    super.artworkUrl100,
    required super.artistId,
    required super.artistName,
    required super.wrapperType});

  factory Song.fromJson(Map<String, dynamic> data) {
    return Song(
        wrapperType: data["wrapperType"],
        artistId: data["artistId"],
        artistName: data["artistName"],
        trackId: data["trackId"],
        trackName: data["trackName"],
        collectionId: data["collectionId"],
        collectionName: data["collectionName"],
        artworkUrl100: data["artworkUrl100"],
        price: data["trackPrice"]
    );
  }
}
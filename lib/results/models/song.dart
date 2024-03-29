import 'result_dto.dart';

class Song extends ResultDTO {
  final int trackId;
  final String? trackName;
  final int collectionId;
  final String? collectionName;
  final String? artworkUrl100;
  final double? trackPrice;
  Song({
    required this.trackId,
    required this.trackName,
    required this.collectionId,
    this.collectionName,
    this.artworkUrl100,
    this.trackPrice,
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
        trackPrice: data["trackPrice"]
    );
  }
}
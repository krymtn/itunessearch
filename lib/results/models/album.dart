import 'result_dto.dart';

class Album extends ResultDTO {
  final int collectionId;

  Album({
    required this.collectionId,
    super.trackName,
    super.price,
    super.artworkUrl100,
    required super.artistId,
    required super.artistName,
    required super.wrapperType});

  factory Album.fromJson(Map<String, dynamic> data) {
    return Album(
        wrapperType: data["wrapperType"],
        artistId: data["artistId"],
        artistName: data["artistName"],
        collectionId: data["collectionId"],
        trackName: data["collectionName"],
        artworkUrl100: data["artworkUrl100"],
        price: data["collectionPrice"]
    );
  }
}
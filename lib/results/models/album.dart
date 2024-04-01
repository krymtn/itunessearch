import 'result_dto.dart';

class Album extends ResultDTO {
  final int collectionId;
  final String? collectionName;
  final String? artworkUrl100;
  final double? collectionPrice;

  Album({
    required this.collectionId,
    this.collectionName,
    this.artworkUrl100,
    this.collectionPrice,
    required super.artistId,
    required super.artistName,
    required super.wrapperType});

  factory Album.fromJson(Map<String, dynamic> data) {
    return Album(
        wrapperType: data["wrapperType"],
        artistId: data["artistId"],
        artistName: data["artistName"],
        collectionId: data["collectionId"],
        collectionName: data["collectionName"],
        artworkUrl100: data["artworkUrl100"],
        collectionPrice: data["collectionPrice"]
    );
  }
}
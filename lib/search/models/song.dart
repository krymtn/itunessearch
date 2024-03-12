import '../../base_result_dto.dart';

class Song extends Result {
  final int trackId;
  final String? trackName;
  final int collectionId;
  Song({required this.trackId, required this.trackName, required this.collectionId, required super.artistId, required super.artistName, required super.wrapperType});

  @override
  String? get searchValue => trackName;

  factory Song.fromJson(Map<String, dynamic> data) {
    return Song(
        wrapperType: data["wrapperType"],
        artistId: data["artistId"],
        artistName: data["artistName"],
        trackId: data["trackId"],
        trackName: data["trackName"],
        collectionId: data["collectionId"]
    );
  }
}
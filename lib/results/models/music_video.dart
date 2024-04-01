import 'models.dart';

class MusicVideo extends ResultDTO {
  final int trackId;
  final String? trackName;
  final double? trackPrice;
  final String? artworkUrl100;
  MusicVideo(
      {required this.trackId,
      this.trackName,
      this.trackPrice,
      this.artworkUrl100,
      required super.artistId,
      required super.artistName,
      required super.wrapperType});

  factory MusicVideo.fromJson(Map<String, dynamic> data) {
    return MusicVideo(
        trackId: data["trackId"],
        trackName: data["trackName"],
        wrapperType: data["wrapperType"],
        artistId: data["artistId"],
        artistName: data["artistName"],
        trackPrice: data["trackPrice"],
        artworkUrl100: data["artworkUrl100"]
    );
  }
}

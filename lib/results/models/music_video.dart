import 'models.dart';

class MusicVideo extends ResultDTO {
  final int trackId;

  MusicVideo(
      {required this.trackId,
      super.trackName,
      super.price,
      super.artworkUrl100,
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
        price: data["trackPrice"],
        artworkUrl100: data["artworkUrl100"]
    );
  }
}

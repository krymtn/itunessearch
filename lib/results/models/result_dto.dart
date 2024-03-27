import 'artist.dart';
import 'collection.dart';
import 'song.dart';
import 'result.dart';

class ResultDTO implements Result {
  @override
  final String wrapperType;
  @override
  final int artistId;
  @override
  final String? artistName;

  ResultDTO({required this.artistId, required this.artistName, required this.wrapperType});

  factory ResultDTO.fromJson(Map<String, dynamic> data) {
    String wrapperType = data["wrapperType"];
    switch(wrapperType) {
      case "artist":
        return Artist.fromJson(data);
      case "track":
        return Song.fromJson(data);
      case "collection":
        return Collection.fromJson(data);
      default:
        return ResultDTO(
            wrapperType: data["wrapperType"],
            artistId: data["artistId"],
            artistName: data["artistName"]
        );
    }
  }
}
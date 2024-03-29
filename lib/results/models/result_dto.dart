import 'artist.dart';
import 'album.dart';
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
    return ResultDTO(
        wrapperType: data["wrapperType"],
        artistId: data["artistId"],
        artistName: data["artistName"]
    );
  }
}
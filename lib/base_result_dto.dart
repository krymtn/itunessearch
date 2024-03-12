import 'search/models/artist.dart';
import 'search/models/collection.dart';
import 'search/models/song.dart';

abstract class BaseResult {
  String get wrapperType;
  int get artistId;
  String? get artistName;
}

class Result implements BaseResult {
  @override
  final String wrapperType;
  @override
  final int artistId;
  @override
  final String? artistName;

  String? get searchValue => null;

  Result({required this.artistId, required this.artistName, required this.wrapperType});

  factory Result.fromJson(Map<String, dynamic> data) {
    String wrapperType = data["wrapperType"];
    switch(wrapperType) {
      case "artist":
        return Artist.fromJson(data);
      case "track":
        return Song.fromJson(data);
      case "collection":
        return Collection.fromJson(data);
      default:
        return Result(
            wrapperType: data["wrapperType"],
            artistId: data["artistId"],
            artistName: data["artistName"]
        );
    }
  }
}
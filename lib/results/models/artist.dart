import 'result_dto.dart';

class Artist extends ResultDTO {
  Artist({required super.artistId, required super.artistName, required super.wrapperType});

  factory Artist.fromJson(Map<String, dynamic> data) {
    return Artist(
        wrapperType: data["wrapperType"],
        artistId: data["artistId"],
        artistName: data["artistName"]
    );
  }
}
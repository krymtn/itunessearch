import '../../base_result_dto.dart';

class Artist extends Result {
  Artist({required super.artistId, required super.artistName, required super.wrapperType});

  @override
  String? get searchValue => artistName;

  factory Artist.fromJson(Map<String, dynamic> data) {
    return Artist(
        wrapperType: data["wrapperType"],
        artistId: data["artistId"],
        artistName: data["artistName"]
    );
  }
}
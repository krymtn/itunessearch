import 'result.dart';

class ResultDTO implements Result {
  @override
  String? wrapperType;
  @override
  int? artistId;
  @override
  String? artistName;

  @override
  String? artworkUrl100;
  @override
  double? price;
  @override
  String? trackName;

  ResultDTO({this.artistId, this.artistName, this.wrapperType, this.artworkUrl100, this.price, this.trackName});

  factory ResultDTO.fromJson(Map<String, dynamic> data) {
    return ResultDTO(
        wrapperType: data["wrapperType"],
        artistId: data["artistId"],
        artistName: data["artistName"]
    );
  }
}
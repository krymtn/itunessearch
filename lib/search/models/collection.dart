import '../../base_result_dto.dart';

class Collection extends Result {
  final String? collectionName;
  final String? artworkUrl60;
  Collection({
    required this.collectionName,
    required this.artworkUrl60,
    required super.artistId,
    required super.artistName,
    required super.wrapperType});

  @override
  String? get searchValue => collectionName;

  factory Collection.fromJson(Map<String, dynamic> data) {
    return Collection(
        wrapperType: data["wrapperType"],
        artistId: data["artistId"],
        artistName: data["artistName"],
        collectionName: data["collectionName"],
        artworkUrl60: data["artworkUrl60"]);
  }
}
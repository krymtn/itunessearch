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
}
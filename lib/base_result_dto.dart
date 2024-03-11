abstract class BaseResult {
  String get wrapperType;
  String get artistId;
  String? get artistName;
}

class Result implements BaseResult {
  @override
  final String wrapperType;
  @override
  final String artistId;
  @override
  final String? artistName;

  Result({required this.artistId, required this.artistName, required this.wrapperType});
}
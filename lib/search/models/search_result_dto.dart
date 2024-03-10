class SearchResultDTO {
  String? artistName;
  String? collectionName;
  String? trackName;
  SearchResultDTO({this.artistName, this.collectionName, this.trackName});

  factory SearchResultDTO.fromJson(Map<String, dynamic> data) {
    return SearchResultDTO(
      artistName: data["artistName"],
      collectionName: data["collectionName"],
      trackName: data["trackName"]
    );
  }
}
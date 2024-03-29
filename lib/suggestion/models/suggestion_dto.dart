import 'suggestion.dart';

class SuggestionDTO implements Suggestion {
  @override
  String? suggestionString;
  @override
  late String wrapperType;

  SuggestionDTO({required this.wrapperType, this.suggestionString});

  factory SuggestionDTO.fromJson(Map<String, dynamic> data) {
    String type = data["wrapperType"];
    String? value;
    if (type == "artist") {
      value = data["artistName"];
    } else if (type == "song") {
      value = data["trackName"];
    } else if (type == "collection") {
      value = data["collectionName"];
    }
    return SuggestionDTO(
        wrapperType: data["wrapperType"],
        suggestionString: value
    );
  }
}
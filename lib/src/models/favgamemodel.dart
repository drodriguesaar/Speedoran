class FavGameModel{

  String favGameID;
  String title;
  String urlGameCover;

  FavGameModel({this.favGameID, this.title, this.urlGameCover});

  Map<String, dynamic> toMap() {
    return {
      'favGameID': favGameID,
      'title': title,
      'urlGameCover': urlGameCover
    };
  }
}
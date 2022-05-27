import 'dart:convert';

import 'package:http/http.dart' as http;

class Game {
  int id;
  String title;
  String thumbnail;
  String gameUrl;
  String desc;
  String genre;
  String patform;
  String publisher;
  String developer;
  String releaseDate;

  Game({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.gameUrl,
    required this.desc,
    required this.genre,
    required this.patform,
    required this.publisher,
    required this.developer,
    required this.releaseDate,
  });

  // mengambil data json tiap product
  factory Game.fromJson(Map<String, dynamic> object) {
    return Game(
      id: object["id"],
      title: object["title"],
      thumbnail: object["thumbnail"],
      gameUrl: object["game_url"],
      desc: object["short_description"],
      genre: object["genre"],
      patform: object["platform"],
      publisher: object["publisher"],
      developer: object["developer"],
      releaseDate: object["release_date"],
    );
  }

  static Future<List<Game>> connectToApi() async {
    String apiUrl = "https://www.freetogame.com/api/games";
    List<Game> game = [];

    var apiResult = await http.get(Uri.parse(apiUrl));
    var jsonObject = jsonDecode(apiResult.body);

    for (var i = 0; i < jsonObject.length; i++) {
      game.add(Game.fromJson(jsonObject[i]));
    }
    return game;
  }
}

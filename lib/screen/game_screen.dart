import 'package:flutter/material.dart';
import 'package:pertemuan_4/details.dart';
import 'package:pertemuan_4/model/game_model.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<Game> listGame = [];
  _getGame() async {
    await Game.connectToApi().then((value) => listGame = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pertemuan 4 - M. Taufan Ma'ruf 1461900089"),
      ),
      body: FutureBuilder(
        future: _getGame(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              return (snapshot.hasError)
                  ? Text('Error: ${snapshot.error}')
                  : ListView.builder(
                      itemCount: listGame.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: <Widget>[
                            Card(
                              child: ListTile(
                                leading: Image.network(
                                  listGame[index].thumbnail,
                                  width: 50,
                                  fit: BoxFit.fill,
                                ),
                                title: Text(listGame[index].title),
                                subtitle: Text(listGame[index].gameUrl),
                                trailing: RaisedButton(
                                    child: Text("Details"),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => Details(
                                            title: listGame[index].title,
                                            thumbnail:
                                                listGame[index].thumbnail,
                                            desc: listGame[index].desc,
                                            gameUrl: listGame[index].gameUrl,
                                            genre: listGame[index].genre,
                                            patform: listGame[index].patform,
                                            publisher:
                                                listGame[index].publisher,
                                            developer:
                                                listGame[index].developer,
                                            releaseDate:
                                                listGame[index].releaseDate,
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                              margin: EdgeInsets.only(bottom: 15),
                            ),
                          ],
                        );
                      });
          }
        },
      ),
    );
  }
}

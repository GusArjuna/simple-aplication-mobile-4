import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  String title;
  String thumbnail;
  String desc;
  String gameUrl;
  String genre;
  String patform;
  String publisher;
  String developer;
  String releaseDate;

  Details(
      {Key? key,
      required this.title,
      required this.thumbnail,
      required this.desc,
      required this.gameUrl,
      required this.genre,
      required this.patform,
      required this.publisher,
      required this.developer,
      required this.releaseDate})
      : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Rincian"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              '${widget.thumbnail}',
              width: 200,
              height: 200,
            ),
            Table(
              border: TableBorder.all(),
              columnWidths: <int, TableColumnWidth>{
                0: FixedColumnWidth(100),
                1: FixedColumnWidth(200),
              },
              children: <TableRow>[
                TableRow(children: <Widget>[
                  Text('Judul'),
                  Text('${widget.title}'),
                ]),
                TableRow(children: <Widget>[
                  Text('DesCription'),
                  Text('${widget.desc}'),
                ]),
                TableRow(children: <Widget>[
                  Text('Genre'),
                  Text('${widget.genre}'),
                ]),
                TableRow(children: <Widget>[
                  Text('Platform'),
                  Text('${widget.patform}'),
                ]),
                TableRow(children: <Widget>[
                  Text('Publisher'),
                  Text('${widget.publisher}'),
                ]),
                TableRow(children: <Widget>[
                  Text('Developer'),
                  Text('${widget.developer}'),
                ]),
                TableRow(children: <Widget>[
                  Text('Release Date'),
                  Text('${widget.releaseDate}'),
                ]),
                TableRow(children: <Widget>[
                  Text('Game URL'),
                  Text('${widget.gameUrl}'),
                ]),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MovieDetail extends StatelessWidget {
  final String title;
  final String posterPath;
  final String overview;

  const MovieDetail({
    super.key,
    required this.title,
    required this.posterPath,
    required this.overview,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Back to the list", textAlign: TextAlign.left),
      ),
      body: Column(children: [Text(title)]),
    );
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieflix/models/moviemodel.dart';

class ApiService {
  static const String popularbaseURL =
      "https://movies-api.nomadcoders.workers.dev/popular";
  static const String nowplayingURL =
      "https://movies-api.nomadcoders.workers.dev/now-playing";
  static const String comingsoonURL =
      "https://movies-api.nomadcoders.workers.dev/coming-soon";
  static const String detailmoveieURL =
      "https://movies-api.nomadcoders.workers.dev/movie?id=1";

  static Future<List<Moviemodel>> getPopularMovies() async {
    List<Moviemodel> moviemodel = [];

    final url = Uri.parse(popularbaseURL);
    final response = await http.get(
      url,
    ); // await can only be used in the async function
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final movies = (jsonData['results'] as List<dynamic>);
      for (var movie in movies) {
        moviemodel.add(Moviemodel.fromJson(movie));
      }
      return moviemodel;
    } else {
      throw Error();
    }
  }

  static Future<List<Moviemodel>> getNowPlayingMovies() async {
    List<Moviemodel> moviemodel = [];

    final url = Uri.parse(nowplayingURL);
    final response = await http.get(
      url,
    ); // await can only be used in the async function
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final movies = (jsonData['results'] as List<dynamic>);
      for (var movie in movies) {
        moviemodel.add(Moviemodel.fromJson(movie));
      }
      return moviemodel;
    } else {
      throw Error();
    }
  }

  static Future<List<Moviemodel>> getComingSoonMoveis() async {
    List<Moviemodel> moviemodel = [];

    final url = Uri.parse(comingsoonURL);
    final response = await http.get(
      url,
    ); // await can only be used in the async function
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final movies = (jsonData['results'] as List<dynamic>);
      for (var movie in movies) {
        moviemodel.add(Moviemodel.fromJson(movie));
      }
      return moviemodel;
    } else {
      throw Error();
    }
  }
}

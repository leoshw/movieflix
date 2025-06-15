import 'package:flutter/material.dart';
import 'package:movieflix/models/moviemodel.dart';
import 'package:movieflix/screens/detail_screen.dart';
import 'package:movieflix/services/api_services.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<Moviemodel>> popular_movies =
      ApiService.getPopularMovies(); // fetch the movies data
  final Future<List<Moviemodel>> now_playing = ApiService.getNowPlayingMovies();
  final Future<List<Moviemodel>> coming_soon = ApiService.getComingSoonMoveis();

  // hello
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            spacing: 20,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Popular movies",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              showmovies(popular_movies, 300, 350),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Now in Cinemas",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              showmovies(now_playing, 180, 150, isNow: true),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Coming soon",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              showmovies(coming_soon, 180, 150),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox showmovies(
    Future<List<Moviemodel>> movies,
    double Height,
    double Width, {
    bool isNow = false,
  }) {
    return SizedBox(
      height: isNow ? Height + 90 : Height,
      child: FutureBuilder(
        future: movies,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(width: 10);
              },
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var movie = snapshot.data![index]; // organize data by index
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => MovieDetail(
                                title: movie.title,
                                posterPath: movie.posterPath,
                                overview: movie.overview,
                              ),
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: SizedBox(
                            width: Width,
                            child: SizedBox(
                              height: Height,
                              child: Image.network(
                                "https://image.tmdb.org/t/p/w500/${movie.posterPath}",
                                width: Width,
                                height: Height,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (isNow)
                        SizedBox(
                          width: Width,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              movie.title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(color: Colors.pink),
          );
        },
      ),
    );
  }
}

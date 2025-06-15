class Moviemodel {
  final bool adult;
  final String backdropPath;
  final List<int> genre_ids;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;
  // Optional field

  Moviemodel.fromJson(Map<String, dynamic> json)
    : adult = json['adult'],
      backdropPath = json['backdrop_path'],
      genre_ids =
          (json['genre_ids'] as List<dynamic>?)
              ?.map((id) => id as int)
              .toList() ??
          [],
      id = json['id'],
      originalLanguage = json['original_language'],
      originalTitle = json['original_title'],
      overview = json['overview'],
      popularity = json['popularity'],
      posterPath = json['poster_path'],
      releaseDate = json['release_date'],
      title = json['title'],
      video = json['video'],
      voteAverage = (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      voteCount = json['vote_count'];
}

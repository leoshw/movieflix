class Moviemodel {
  final String adult;
  final String backdropPath;
  final String genreIds;
  final String id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final String popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final String video;
  final String voteAverage;
  final String voteCount;
  // Optional field

  Moviemodel.fromJson(Map<String, dynamic> json)
    : adult = json['adult'],
      backdropPath = json['backdrop_path'],
      genreIds = json['genre_ids'],
      id = json['id'],
      originalLanguage = json['original_language'],
      originalTitle = json['original_title'],
      overview = json['overview'],
      popularity = json['popularity'],
      posterPath = json['poster_path'],
      releaseDate = json['release_date'],
      title = json['title'],
      video = json['video'],
      voteAverage = json['vote_average'],
      voteCount = json['vote_count'];
}

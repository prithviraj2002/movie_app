class MovieResults {
  MovieResults({
      required this.adult,
      required this.backdropPath,
      required this.id,
      required this.title,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.posterPath,
      required this.mediaType,
      required this.genreIds,
      required this.popularity,
      required this.releaseDate,
      required this.video,
      required this.voteAverage,
      required this.voteCount,});

  factory MovieResults.fromJson(dynamic json) {
    return MovieResults(
        adult: json['adult'],
        backdropPath: json['backdrop_path'],
        id: json['id'],
        title: json['title'],
        originalLanguage: json['original_language'],
        originalTitle: json['original_title'],
        overview: json['overview'],
        posterPath: json['poster_path'],
        mediaType: json['media_type'],
        genreIds: json['genre_ids'],
        popularity: json['popularity'],
        releaseDate: json['release_date'],
        video: json['video'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count']);
  }
  bool adult;
  String backdropPath;
  int id;
  String title;
  String originalLanguage;
  String originalTitle;
  String overview;
  String posterPath;
  String mediaType;
  List<dynamic> genreIds;
  double popularity;
  String releaseDate;
  bool video;
  double voteAverage;
  int voteCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['id'] = id;
    map['title'] = title;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['poster_path'] = posterPath;
    map['media_type'] = mediaType;
    map['genre_ids'] = genreIds;
    map['popularity'] = popularity;
    map['release_date'] = releaseDate;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }

}
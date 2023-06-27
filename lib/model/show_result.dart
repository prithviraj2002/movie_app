class ShowResults {
  ShowResults({
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.name,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.genreIds,
    required this.popularity,
    required this.firstAirDate,
    required this.voteAverage,
    required this.voteCount,
    required this.originCountry
  });

  factory ShowResults.fromJson(dynamic json) {
    return ShowResults(
        adult: json['adult'],
        backdropPath: json['backdrop_path'],
        id: json['id'],
        name: json['name'],
        originalLanguage: json['original_language'],
        originalName: json['original_name'],
        overview: json['overview'],
        posterPath: json['poster_path'],
        mediaType: json['media_type'],
        genreIds: json['genre_ids'],
        popularity: json['popularity'],
        firstAirDate: json['first_air_date'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count'],
      originCountry: json['origin_country']
    );
  }
  bool adult;
  String backdropPath;
  int id;
  String name;
  String originalLanguage;
  String originalName;
  String overview;
  String posterPath;
  String mediaType;
  List<dynamic> genreIds;
  double popularity;
  String firstAirDate;
  double voteAverage;
  int voteCount;
  List<dynamic> originCountry;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['id'] = id;
    map['name'] = name;
    map['original_language'] = originalLanguage;
    map['original_name'] = originalName;
    map['overview'] = overview;
    map['poster_path'] = posterPath;
    map['media_type'] = mediaType;
    map['genre_ids'] = genreIds;
    map['popularity'] = popularity;
    map['release_date'] = firstAirDate;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }

}
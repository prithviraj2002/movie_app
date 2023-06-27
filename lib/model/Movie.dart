import 'Results.dart';

class Movie {
  Movie({
      required this.page,
      required this.results,
      required this.totalPages,
      required this.totalResults,});

  factory Movie.fromJson(dynamic json) {
    final List<MovieResults> results = [];
    json['results'].forEach((v) {
      results.add(MovieResults.fromJson(v));
    });
    return Movie(
        page: json['page'],
        results: results,
        totalPages: json['total_pages'],
        totalResults: json['total_results']
    );
  }
  int page;
  List<MovieResults> results;
  int totalPages;
  int totalResults;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    map['results'] = results.map((v) => v.toJson()).toList();
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }

}
import 'dart:convert';

import 'package:trending/constants/url.dart';
import 'package:http/http.dart' as http;
import 'package:trending/model/Movie.dart';
import 'package:trending/model/Results.dart';
import 'package:trending/model/Show.dart';
import 'package:trending/model/show_result.dart';

class ApiFunctions{

  static Future<List<MovieResults>> getMovies({int page = 1}) async{
    List<MovieResults> results = [];
    final p = page.toString();
    try{
      final response = await http.get(Uri.parse(ApiUrl.movieApi+p));
      final data = jsonDecode(response.body);
      for(dynamic movie in data["results"]){
        results.add(MovieResults.fromJson(movie));
      }
      return results;
    }on Exception catch(_){
      rethrow;
    }
  }

  static Future<List<ShowResults>> getShows({int page = 1}) async{
    List<ShowResults> results = [];
    final p = page.toString();
    try{
      final response = await http.get(Uri.parse(ApiUrl.tvApi+p));
      final data = jsonDecode(response.body);
      for(dynamic person in data["results"]){
        results.add(ShowResults.fromJson(person));
      }
      return results;
    }on Exception catch(_){
      rethrow;
    }
  }

}
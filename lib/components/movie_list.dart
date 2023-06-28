import 'package:flutter/material.dart';
import 'package:trending/api/MovieApi.dart';
import 'package:trending/constants/dimens.dart';
import 'package:trending/constants/image_function.dart';
import 'package:trending/model/Movie.dart';
import 'package:trending/model/Results.dart';

class Movies extends StatefulWidget {
  const Movies({Key? key}) : super(key: key);

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  
  int page = 1;
  ScrollController _scrollController = ScrollController();
  
  void loadMore(){
    setState(() {
      page += 1;
    });
  }
  
  @override
  void initState() {
    // TODO: implement initState
    _scrollController.addListener(_scrollListener);
    super.initState();
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiFunctions.getMovies(page: page),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            final List<MovieResults> movies = snapshot.data;
            return GridView.builder(
              controller: _scrollController,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemBuilder: (ctx, index){
                return GridTile(
                  child: Image.network(
                    returnImageSource(Dimens.size400, movies[index].posterPath),
                    fit: BoxFit.cover,
                  ),
                );
              },
              itemCount: movies.length,
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  void _scrollListener(){
    if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
      loadMore();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:trending/api/MovieApi.dart';
import 'package:trending/constants/dimens.dart';
import 'package:trending/constants/image_function.dart';
import 'package:trending/model/show_result.dart';

class Shows extends StatefulWidget {
  const Shows({Key? key}) : super(key: key);

  @override
  State<Shows> createState() => _ShowsState();
}

class _ShowsState extends State<Shows> {

  int page = 1;

  Future<void> loadMore() async{
    setState(() {
      page += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiFunctions.getShows(page: page),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            final List<ShowResults> shows = snapshot.data;
            if(MediaQuery.of(context).size.width > Dimens.maxWidth){
              return Column(
                    children: <Widget>[
                      Expanded(
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 300,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              mainAxisExtent: 300),
                          itemBuilder: (ctx, index){
                            return Image.network(
                              returnImageSource(Dimens.size400, shows[index].posterPath),
                              fit: BoxFit.cover,
                            );
                          },
                          itemCount: shows.length,
                        ),
                      ),
                      Container(
                        color: Colors.black26,
                        child: NumberPaginator(
                          numberPages: 10,
                          onPageChange: (int index){
                            setState(() {
                              page = index+1;
                            });
                          },
                        ),
                      )
                    ]
                );
            }
            else{
              return RefreshIndicator(
                  onRefresh: loadMore,
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 300,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        mainAxisExtent: 300),
                    itemBuilder: (ctx, index){
                      if(MediaQuery.of(context).size.width > Dimens.maxWidth){

                      }
                      else{
                        return Image.network(
                          returnImageSource(Dimens.size300, shows[index].posterPath),
                          fit: BoxFit.scaleDown,
                        );
                      }
                    },
                    itemCount: shows.length,
                  )
              );
            }
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

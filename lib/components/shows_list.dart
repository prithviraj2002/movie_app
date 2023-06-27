import 'package:flutter/material.dart';
import 'package:trending/api/MovieApi.dart';
import 'package:trending/constants/dimens.dart';
import 'package:trending/constants/image_function.dart';
import 'package:trending/model/Results.dart';
import 'package:trending/model/Show.dart';
import 'package:trending/model/show_result.dart';

class Shows extends StatelessWidget {
  const Shows({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiFunctions.getShows(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            final List<ShowResults> shows = snapshot.data;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemBuilder: (ctx, index){
                return GridTile(
                  header: Container(),
                  footer: Container(
                    color: Colors.black26,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(shows[index].name, style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  child: Image.network(
                    returnImageSource(Dimens.size400, shows[index].posterPath),
                    fit: BoxFit.cover,
                  ),
                );
              },
              itemCount: shows.length,
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trending/components/movie_list.dart';
import 'package:trending/components/shows_list.dart';
import 'package:trending/provider/screen_provider.dart';

class DesktopView extends StatelessWidget {
  const DesktopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trending"),
      ),
      body: Consumer<ScreenProvider>(
        builder : (buildContext, screenProvider, child) => Row(
          children: [
            Container(
                  alignment: Alignment.center,
                  width: 250,
                  child: ListView(
                    children: [
                      ListTile(
                        title: Text(
                            "Movies",
                          style: screenProvider.screen == 1? const TextStyle(color: Colors.brown, fontSize: 20) : const TextStyle(color: Colors.black),
                        ),
                        onTap: (){
                          screenProvider.movieScreen();
                        },
                      ),
                      ListTile(
                        title: Text(
                            "Shows",
                          style: screenProvider.screen == 2? const TextStyle(color: Colors.brown, fontSize: 20) : const TextStyle(color: Colors.black),
                        ),
                        onTap: (){
                          screenProvider.showScreen();
                        },
                      ),
                    ],
                  ),
                ),
            Expanded(
                child: screenProvider.screen == 1 ? const Movies() : screenProvider.screen == 2 ? const Shows() : const Center(child: CircularProgressIndicator(),)
            )
          ],
        ),
      ),
    );
  }
}

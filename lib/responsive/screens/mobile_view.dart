import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trending/components/movie_list.dart';
import 'package:trending/components/shows_list.dart';
import 'package:trending/provider/screen_provider.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Trending"),
        ),
        body: Consumer<ScreenProvider>(
          builder: (buildContext, screenProvider, child) => screenProvider.screen == 1 ? const Movies() : screenProvider.screen == 2 ? const Shows() : const Center(child: CircularProgressIndicator(),)),
        drawer: Consumer<ScreenProvider>(
          builder: (buildContext, screenProvider, child) => Drawer(
            backgroundColor: Colors.white,
            child: ListView(
              children: [
                ListTile(
                  title: Text(
                      "Movies",
                    style: screenProvider.screen == 1? const TextStyle(color: Colors.brown, fontSize: 20) : const TextStyle(color: Colors.black),
                  ),
                  onTap: (){
                    screenProvider.movieScreen();
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: Text(
                      "Shows",
                    style: screenProvider.screen == 2? const TextStyle(color: Colors.brown, fontSize: 20) : const TextStyle(color: Colors.black),
                  ),
                  onTap: (){
                    screenProvider.showScreen();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        )
    );
  }
}

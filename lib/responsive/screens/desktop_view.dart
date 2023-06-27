import 'package:flutter/material.dart';
import 'package:trending/components/movie_list.dart';
import 'package:trending/components/shows_list.dart';

class DesktopView extends StatefulWidget {
  const DesktopView({Key? key}) : super(key: key);

  @override
  State<DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {

  int screen = 1;

  void setScreen(int s){
    setState(() {
      screen = s;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trending"),
      ),
      body: Row(
        children: [
          Container(
              alignment: Alignment.center,
              width: 300,
              child: ListView(
                children: [
                  ListTile(
                    title: const Text("Movies"),
                    onTap: (){
                      setScreen(1);
                    },
                  ),
                  ListTile(
                    title: const Text("Shows"),
                    onTap: (){
                      setScreen(2);
                    },
                  ),
                ],
              ),
            ),
          Expanded(
              child: screen == 1 ? const Movies() : screen == 2 ? const Shows() : const Center(child: CircularProgressIndicator(),)
          )
        ],
      ),
    );
  }
}
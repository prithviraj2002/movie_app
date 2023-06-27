import 'package:flutter/material.dart';
import 'package:trending/components/movie_list.dart';
import 'package:trending/components/shows_list.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {

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
        body: screen == 1 ? const Movies() : screen == 2 ? const Shows() : const Center(child: CircularProgressIndicator(),),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            children: [
              ListTile(
                title: const Text("Movies"),
                onTap: (){
                  setScreen(1);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text("Shows"),
                onTap: (){
                  setScreen(2);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        )
    );
  }
}

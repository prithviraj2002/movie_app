import 'package:flutter/cupertino.dart';

class ScreenProvider extends ChangeNotifier{
  int screen = 1;

  void showScreen(){
    screen = 2;
    notifyListeners();
  }

  void movieScreen(){
    screen = 1;
    notifyListeners();
  }

  int get _screen{
    return screen;
  }
}
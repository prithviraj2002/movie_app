import 'package:flutter/material.dart';
import 'package:trending/constants/dimens.dart';

class ResponsiveScreen extends StatelessWidget {
  Widget mobileBody;
  Widget desktopBody;
  ResponsiveScreen({required this.mobileBody, required this.desktopBody, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints){
          if(constraints.maxWidth < Dimens.maxWidth){
            return mobileBody;
          }
          else{
            return desktopBody;
          }
        }
    );
  }
}

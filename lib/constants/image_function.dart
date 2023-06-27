import 'package:trending/constants/url.dart';

String returnImageSource(String size, String path){
  return ApiUrl.baseUrl + size + path;
}
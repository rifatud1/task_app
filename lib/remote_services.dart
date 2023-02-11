import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'models/home_model/home_model.dart';
class RemoteServices {
  static Future<HomeModel?> fetchVideos() async{
    var response = await http.get(Uri.parse('https://hajjmanagment.online/api/external/atab/m360ict/get/video/app/test'));
    if(response.statusCode == 200){
      print("successful");
      var jsonString  = response.body;
      return homeModelFromJson(jsonString);
    }else{
      print("went to else null");
      return null;
    }

  }
}
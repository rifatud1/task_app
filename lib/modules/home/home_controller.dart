import 'package:get/get.dart';

import '../../models/home_model/home_model.dart';
import '../../remote_services.dart';

class HomeController extends GetxController {
  var videoList = Rxn<HomeModel>();
  @override
  void onInit() {
    fetchVideos();
    // TODO: implement onInit
    super.onInit();
  }

  void fetchVideos() async{
    var  videos = await RemoteServices.fetchVideos();
    if(videos != null){
      print("videos are not null");
      videoList.value = videos;
    }
  }
}
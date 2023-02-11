import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/modules/home/home_controller.dart';
import 'package:task_app/utils/chewie_list_item.dart';
import 'package:video_player/video_player.dart';


class Home extends StatelessWidget {
  HomeController _homeController = Get.put(HomeController());
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
        return Scaffold(
          body: ListView.builder(itemCount: _homeController.videoList.value!.data.length != null ?_homeController.videoList.value!.data.length : 0,itemBuilder: (context, index){
            var video = _homeController.videoList.value!.data[index];
            return Container(height: 200, child: ChewieListItem(videoPlayerController: VideoPlayerController.network(video.videoUrl), looping: true));
          }),
        );
      }
    );
  }
}

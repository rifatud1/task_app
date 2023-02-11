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
        appBar: AppBar(
          leading: Icon(Icons.camera_alt_rounded, color: Colors.black,),
          actions: [
            Icon(Icons.circle_notifications_rounded, color: Colors.black,)
          ],
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Explore",
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: _homeController.videoList.value!.data.length != null
                ? _homeController.videoList.value!.data.length
                : 0,
            itemBuilder: (context, index) {
              var video = _homeController.videoList.value!.data[index];
              return ClipRRect(
                borderRadius: BorderRadius.circular(35.0),
                child: Card(
                  child: Container(
                    height: 250,
                    color: Color(0xffDBFFEE),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 18.0, right: 8.0, bottom: 8.0, top: 8.0),
                          child: Text(
                            video.caption,
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        ChewieListItem(
                            videoPlayerController:
                                VideoPlayerController.network(video.videoUrl),
                            looping: true),
                      ],
                    ),
                  ),
                ),
              );
            }),
      );
    });
  }
}

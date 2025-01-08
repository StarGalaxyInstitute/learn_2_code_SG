// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_to_code/Constrant/utilities.dart';

import '../../Constrant/common_widgets.dart';
import '../Controllers/staff_shortvideos_controller.dart';

class StaffShortvideosScreen extends StatelessWidget {
  final ShortVideosController controller = Get.put(ShortVideosController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
           backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: CommonWidgets().textWidget(
            text: 'Short Videos',
            textSize: 17.0,
            textAlign: TextAlign.start,
            textWeight: FontWeight.bold),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          return ListView.builder(
            itemCount: controller.videos.length,
            itemBuilder: (context, index) {
              final video = controller.videos[index];
              return ShortVideoCard(
                user: video.user,
                time: video.time,
                description: video.description,
                videoThumbnail: video.videoThumbnail,
                likes: video.likes,
                comments: video.comments,
              );
            },
          );
        }),
      ),
    );
  }
}

class ShortVideoCard extends StatelessWidget {
  final String user;
  final String time;
  final String description;
  final String videoThumbnail;
  final String likes;
  final String comments;

  ShortVideoCard({
    required this.user,
    required this.time,
    required this.description,
    required this.videoThumbnail,
    required this.likes,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.btnborder),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Info and Three-Dot Menu
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_rpCV_Esm0MpYTJEy8d5XqtzEDUFre-D_1g&s"), // Replace with actual asset
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonWidgets().textWidget(
                            text: user,
                            textSize: 14.0,
                            textAlign: TextAlign.start,
                            textWeight: FontWeight.bold),
                        CommonWidgets().textWidget(
                            text: time,
                            textSize: 11.0,
                            textAlign: TextAlign.start,
                            textWeight: FontWeight.w400),
                      ],
                    ),
                  ],
                ),
                Icon(Icons.more_vert),
              ],
            ),
            SizedBox(height: 12),

            // Video Description
            CommonWidgets().textWidget(
                text: description,
                textSize: 13.0,
                textmaxLine: 2,
                textoverFlow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                textWeight: FontWeight.w500),

            SizedBox(height: 12),

            // Video Thumbnail
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    videoThumbnail,
                    width: double.infinity,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: CommonWidgets().textWidget(
                        text: '02:05',
                        textColor: AppColors.whitecolor,
                        textSize: 12.0,
                        textAlign: TextAlign.start,
                        textWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Icon(Icons.play_circle_fill,
                      size: 40, color: Colors.white),
                ),
              ],
            ),

            SizedBox(height: 12),

            // Action Buttons (Like, Comment, Save)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.thumb_up,
                      color: Colors.grey,
                      size: 16,
                    ),
                    SizedBox(height: 4),
                    CommonWidgets().textWidget(
                        text: '$likes Likes',
                        textSize: 12.0,
                        textAlign: TextAlign.start,
                        textWeight: FontWeight.w500),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.comment,
                      color: Colors.grey,
                      size: 16,
                    ),
                    SizedBox(height: 4),
                    CommonWidgets().textWidget(
                        text: '$comments Comments',
                        textSize: 12.0,
                        textAlign: TextAlign.start,
                        textWeight: FontWeight.w500),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.save_alt,
                      color: Colors.grey,
                      size: 16,
                    ),
                    SizedBox(height: 4),
                    CommonWidgets().textWidget(
                        text: 'Save video',
                        textSize: 12.0,
                        textAlign: TextAlign.start,
                        textWeight: FontWeight.w500),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

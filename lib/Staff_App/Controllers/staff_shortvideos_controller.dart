import 'package:get/get.dart';

class ShortVideos {
  final String user;
  final String time;
  final String description;
  final String likes;
  final String comments;
  final String videoThumbnail;

  ShortVideos({
    required this.user,
    required this.time,
    required this.description,
    required this.likes,
    required this.comments,
    required this.videoThumbnail,
  });
}


class ShortVideosController extends GetxController {
  // List of videos
  var selectedTutor = Rxn<ShortVideos>();

  void selectIndex(ShortVideos tutor) {
    selectedTutor.value = tutor;
  }
 var videos = <ShortVideos>[
   ShortVideos(
      user: "Hridoy Ahmed",
      time: "12 min ago",
      description:
          "Mathematics-1 Calculus solution. Problems solutions with the simple formula...",
      videoThumbnail:
          "assets/images/javascript.png", // Replace with your asset path
      likes: "212",
      comments: "53",
   ),
    ShortVideos(
      user: "Rakib Hossain",
      time: "1 hr ago",
     description:
          "English grammar Parts Of Speech class. This is the very important class. Everyone needs to see it...",
      videoThumbnail:
          "assets/images/javascript.png", // Replace with your asset path
      likes: "178",
      comments: "39",
    ),
      ShortVideos(
      user: "Rakib Hossain",
      time: "1 hr ago",
     description:
          "English grammar Parts Of Speech class. This is the very important class. Everyone needs to see it...",
      videoThumbnail:
          "assets/images/javascript.png", // Replace with your asset path
      likes: "178",
      comments: "39",
    ),
      ShortVideos(
      user: "Rakib Hossain",
      time: "1 hr ago",
      description:
          "English grammar Parts Of Speech class. This is the very important class. Everyone needs to see it...",
      videoThumbnail:
          "assets/images/javascript.png", // Replace with your asset path
      likes: "178",
      comments: "39",
    ),
  ].obs;
}

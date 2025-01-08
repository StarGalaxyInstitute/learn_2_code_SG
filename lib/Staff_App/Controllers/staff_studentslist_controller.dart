import 'package:get/get.dart';


class Studentslist {
  final String name;
  final String batch;
  final String location;
  final String image;
 

  Studentslist({
    required this.name,
    required this.batch,
    required this.location,
    required this.image,
  
  });
}


class StaffStudentslistController extends GetxController {
   var selectedTutor = Rxn<Studentslist>();

  void selectIndex(Studentslist tutor) {
    selectedTutor.value = tutor;
  }


  var student = <Studentslist>[
   Studentslist(
      name: 'Faruque Ahmed',
      batch: 'Batch-10',
      location: 'Gulshan 02, Dhaka',
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_rpCV_Esm0MpYTJEy8d5XqtzEDUFre-D_1g&s',
    ),
       Studentslist(

      name: 'Rashed Islam',
      batch: 'Batch-12',
      location: 'Uttara, Sector 06, Dhaka',
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_rpCV_Esm0MpYTJEy8d5XqtzEDUFre-D_1g&s',
   ),
      Studentslist(

      name: 'Shakhawat Hosen',
      batch: 'Batch-12',
      location: 'Gulshan 02, Dhaka',
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_rpCV_Esm0MpYTJEy8d5XqtzEDUFre-D_1g&s',
   ),
      Studentslist(

      name: 'Humayun Kabir',
      batch: 'Batch-10',
      location: 'Uttara, Sector 06, Dhaka',
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_rpCV_Esm0MpYTJEy8d5XqtzEDUFre-D_1g&s',
   ),
      Studentslist(

      name: 'Jahirul Islam',
      batch: 'Batch-12',
      location: 'Gulshan 02, Dhaka',
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_rpCV_Esm0MpYTJEy8d5XqtzEDUFre-D_1g&s',
   ),
     Studentslist(

      name: 'Minhazul Islam',
      batch: 'Batch-10',
      location: 'Uttara, Sector 06, Dhaka',
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_rpCV_Esm0MpYTJEy8d5XqtzEDUFre-D_1g&s',
   ),
      Studentslist(

      name: 'Fahim Al Hasan',
      batch: 'Batch-12',
      location: 'Gulshan 02, Dhaka',
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_rpCV_Esm0MpYTJEy8d5XqtzEDUFre-D_1g&s',
   ),
  ].obs;
}

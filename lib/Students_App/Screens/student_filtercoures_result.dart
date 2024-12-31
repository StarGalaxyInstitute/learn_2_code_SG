import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/student_filtercoures_resultcontroller.dart';
import '../Helpers/student_coures.dart';

class StudentFiltercouresresult extends StatelessWidget {
  final StudentFiltercouresresultcontroller courseController =
      Get.put(StudentFiltercouresresultcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtered Results'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt),
            onPressed: () {
              // Handle filter logic
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search a course...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                // Add search functionality
              },
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: courseController.courses.length,
                itemBuilder: (context, index) {
                  final course = courseController.courses[index];
                  return CourseCard(course: course);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final StudentCoures course;

  const CourseCard({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Image.asset(
            course.image,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(course.author),
                Row(
                  children: [
                    Text(
                      course.price,
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 5),
                    Text(
                      course.originalPrice,
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 16),
                    SizedBox(width: 5),
                    Text(course.rating),
                  ],
                ),
                if (course.tag.isNotEmpty)
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: course.tag == 'Top Author'
                          ? Colors.purple[100]
                          : Colors.green[100],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      course.tag,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:attendence/res/Colors/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../view_model/services/Bottom_Navigation_Services/Bottom_Navigation_Controller.dart';
import '../../../../../../../view_model/services/StudentTabServices/for_Student_list/controllers/studentTileController.dart';


import '../../../../Bottom_Navigation_Menu.dart';
import '../../../HomeTab/Home_Widget.dart'; // Adjust the import path as necessary

class FetchingStudentScreen extends StatelessWidget {
  final StudentController studentController = Get.put(StudentController());
  final BottomNavigationController bottomNavController = Get.find<BottomNavigationController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        automaticallyImplyLeading: false,
        title: Text('Student List'),
      ),
      body: Obx(() {
        if (studentController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (studentController.students.isEmpty) {
          return Center(child: Text('No data available'));
        } else {
          return ListView.builder(
            itemCount: studentController.students.length,
            itemBuilder: (context, index) {
              var student = studentController.students[index];
              var attendancePercentage = studentController
                  .calculateAttendancePercentage(student.attendance);
              var attendanceColor =
              studentController.getAttendanceColor(attendancePercentage);

              return studentTile(
                name: student.name,
                rollNo: student.roll.toString(),
                attendencePersent: attendancePercentage.toStringAsFixed(2),
                attendanceColor: attendanceColor,
                image:
                'https://via.placeholder.com/150', // Replace with actual image URL if available
              );
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bottomNavController.selectedIndex.value = 0; // Set index to 0
          Get.off(() => BottomNavigationMenu()); // Adjust the navigation as necessary
        },
        backgroundColor: AppColors.primaryColor,
        child: Icon(Icons.home),
      ),
    );
  }
}

Widget studentTile({
  required String name,
  required String rollNo,
  required String attendencePersent,
  required Color attendanceColor,
  required String image,
}) {
  return ListTile(
    leading: CircleAvatar(
      backgroundColor: Colors.blue,
      backgroundImage: NetworkImage(image),
    ),
    title: Text(name, style: TextStyle(fontSize: 16)),
    subtitle: Row(
      children: [
        Text("Roll: $rollNo |", style: TextStyle(fontSize: 14)),
        SizedBox(width: 5),
        Text("Attendance: ", style: TextStyle(fontSize: 14)),
        Text("$attendencePersent%",
            style: TextStyle(color: attendanceColor, fontSize: 14)),
      ],
    ),
  );
}

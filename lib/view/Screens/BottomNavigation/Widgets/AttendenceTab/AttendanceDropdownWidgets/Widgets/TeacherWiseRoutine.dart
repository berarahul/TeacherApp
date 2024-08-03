import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../models/for_attandance_tab/TeacherWiseRoutineModel.dart';
import '../../../../../../../res/Colors/AppColors.dart';
import '../../../../../../../view_model/services/AttendenceTabServices/ForRoutine/RoutineScreenController.dart';


class ScheduleScreen extends StatelessWidget {
  final ScheduleController scheduleController = Get.put(ScheduleController());

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final List<Color> gradientColors;

    if (now.hour >= 6 && now.hour < 12) {
      gradientColors = [Colors.yellow, Colors.lightBlueAccent];
    } else if (now.hour >= 12 && now.hour < 17) {
      gradientColors = [Colors.orangeAccent, Colors.yellowAccent];
    } else if (now.hour >= 17 && now.hour < 22) {
      gradientColors = [AppColors.softRed, AppColors.peach];
    } else {
      gradientColors = [Colors.indigo, Colors.black];
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Obx(() {
          if (scheduleController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else if (scheduleController.schedule.isEmpty) {
            return const Center(
                child: Text('No data available',
                    style: TextStyle(color: Colors.white)));
          } else {
            return ListView.builder(
              itemCount: scheduleController.schedule.keys.length,
              itemBuilder: (ctx, index) {
                String day = scheduleController.schedule.keys.elementAt(index);
                List<Schedule> daySchedule = scheduleController.schedule[day]!;

                return Card(
                  color: Colors.white,
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(

                          gradient: LinearGradient(
                            colors: gradientColors,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Text(
                          day,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1.3,
                          ),
                          itemCount: daySchedule.length,
                          itemBuilder: (ctx, index) {
                            Schedule schedule = daySchedule[index];
                            return Card(
                              margin: EdgeInsets.zero,
                              child: Container(
                                decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                    colors: gradientColors,
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          schedule.subName,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text('Room: ${schedule.roomName}',
                                            style: const TextStyle(
                                                color: Colors.white)),
                                        Text('Teacher: ${schedule.teacherName}',
                                            style: const TextStyle(
                                                color: Colors.white)),
                                        Text(
                                            'Paper Code: ${schedule.paperCode}',
                                            style: const TextStyle(
                                                color: Colors.white)),
                                        Text(
                                            'Time: ${schedule.startingTime} - ${schedule.endingTime}',
                                            style: const TextStyle(
                                                color: Colors.white)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        }),
      ),
    );
  }
}

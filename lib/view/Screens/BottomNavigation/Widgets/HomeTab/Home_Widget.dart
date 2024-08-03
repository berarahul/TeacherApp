

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:auto_scroll_text/auto_scroll_text.dart'; // Import AutoScrollText

import '../../../../../view_model/services/HomeTabService/homeTabController.dart';
import '../../../constant/DigitalClockWidget.dart'; // Import the DigitalClock widget

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
        automaticallyImplyLeading: false,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Obx(() => Container(
        decoration: BoxDecoration(
          gradient: controller.getBackgroundGradient(),
        ),
        child: Column(
          children: [
            SizedBox(height: 60,),
            // Use AutoScrollText with the correct constructor
            if (controller.isHolidayTomorrow.value)
              Container(
                padding: const EdgeInsets.all(16.0),
                color: Colors.red, // Background color for the notification
                child: AutoScrollText(
                  // Provide a unique key
                  'Tomorrow College is Off Due to ${controller.tomorrowHolidayReasons.value}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  scrollDirection: Axis.horizontal,
                  velocity: Velocity(pixelsPerSecond: Offset(30, 0)), // Adjust the scrolling speed
                ),
              ),
            SizedBox(height: 40), // Add spacing before the greeting
            Container(
              padding: const EdgeInsets.all(20.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: controller.greeting.value.split('\n')[0] + '\n',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: controller.greeting.value.split('\n')[1],
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            DigitalClock(), // Show the digital clock
            SizedBox(height: 20), // Add spacing before the class card

            // Conditionally render "Today's Classes" card
            if (controller.holidays.isEmpty)
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          gradient: controller.getBackgroundGradient(), // Use the same gradient for the card
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Today\'s Classes',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Divider(color: Colors.white),
                              SizedBox(height: 8.0),
                              controller.schedules.isNotEmpty
                                  ? Column(
                                children: controller.schedules.map((schedule) {
                                  return Center(
                                    child: Card(
                                      elevation: 4,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      margin: EdgeInsets.symmetric(vertical: 4.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                          gradient: controller.getBackgroundGradient(), // Gradient for inner cards
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Subject: ${schedule.subName}',
                                                style: TextStyle(fontSize: 16, color: Colors.white),
                                              ),
                                              SizedBox(height: 4.0),
                                              Text(
                                                'Room: ${schedule.roomName}',
                                                style: TextStyle(fontSize: 16, color: Colors.white),
                                              ),
                                              SizedBox(height: 4.0),
                                              Text(
                                                'Teacher: ${schedule.teacherName}',
                                                style: TextStyle(fontSize: 16, color: Colors.white),
                                              ),
                                              SizedBox(height: 4.0),
                                              Text(
                                                'Paper Code: ${schedule.paperCode}',
                                                style: TextStyle(fontSize: 16, color: Colors.white),
                                              ),
                                              SizedBox(height: 4.0),
                                              Text(
                                                'Time: ${schedule.startingTime} - ${schedule.endingTime}',
                                                style: TextStyle(fontSize: 16, color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              )
                                  : Text(
                                'No classes scheduled',
                                style: TextStyle(fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            SizedBox(height: 20), // Add spacing before the holiday cards

            // Show holidays list if any
            if (controller.holidays.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: controller.holidays.length,
                  itemBuilder: (context, index) {
                    final holiday = controller.holidays[index];
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            gradient: controller.getBackgroundGradient(), // Use the same gradient for the card
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Holiday: ${holiday['reason']}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  'From: ${holiday['startDate']}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  'To: ${holiday['endDate']}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
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
      )),
    );
  }
}
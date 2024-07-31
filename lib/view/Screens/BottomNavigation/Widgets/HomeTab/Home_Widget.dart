import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
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
        child: Center(
          child: controller.holidays.isEmpty
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              DigitalClock(), // Show the digital clock when no holidays
            ],
          )
              : Column(
            children: [
              SizedBox(height: 80), // Add spacing before the greeting
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
              DigitalClock(), // Show the digital clock above the holiday cards
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Holiday Notice',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Icon(
                                      Icons.notifications,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                                Divider(color: Colors.white),
                                SizedBox(height: 8.0),
                                Text(
                                  'Reason: ${holiday['reason']}',
                                  style: TextStyle(fontSize: 16, color: Colors.white),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  'Start Date: ${holiday['startDate']}',
                                  style: TextStyle(fontSize: 16, color: Colors.white),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  'End Date: ${holiday['endDate']}',
                                  style: TextStyle(fontSize: 16, color: Colors.white),
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
        ),
      )),
    );
  }
}

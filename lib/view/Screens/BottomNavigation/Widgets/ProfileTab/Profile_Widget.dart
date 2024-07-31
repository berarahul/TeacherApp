// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../../view_model/services/HomeTabService/homeTabController.dart';
// import '../../../../../view_model/services/Login_Services/Login_Helper_Function/LoginAuthServices.dart';
// import '../../../../../view_model/services/Login_Services/Login_Helper_Function/Login_Storage_Helper.dart';
//
// import '../../../Login/Login_View.dart'; // Import your HomeController
//
// class ProfileScreen extends StatelessWidget {
//   final HomeController controller = Get.find<HomeController>();
//
//   @override
//   Widget build(BuildContext context) {
//     String? name = LoginStorageHelper.retrieveName();
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       extendBodyBehindAppBar: true,
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           return SingleChildScrollView(
//             child: ConstrainedBox(
//               constraints: BoxConstraints(minHeight: constraints.maxHeight),
//               child: Container(
//                 decoration: BoxDecoration(
//                   gradient: controller.getBackgroundGradient(), // Use gradient from HomeController
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 100),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       CircleAvatar(
//                         radius: 50,
//                         backgroundImage: AssetImage('assets/images/defaultimage/defaultprofile.png'), // Replace with your asset image path
//                       ),
//                       SizedBox(height: 24),
//                       Text(
//                         name ?? 'No Name Available', // Display the retrieved name
//                         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(height: 8),
//                       Text('Dept : BCA'),
//                       SizedBox(height: 50),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           ElevatedButton(
//                             onPressed: () {
//                               Get.snackbar("Edit Profile Screen", "This Screen Available on Next update");
//                             },
//                             child: Text('Edit Profile'),
//                             style: ElevatedButton.styleFrom(
//                               foregroundColor: Colors.black, backgroundColor: Colors.grey.shade300,
//                             ),
//                           ),
//                           ElevatedButton(
//                             onPressed: () {
//                               Get.snackbar("Settings Screen", "This Screen Available in Next update");
//                             },
//                             child: Text('Settings'),
//                             style: ElevatedButton.styleFrom(
//                               foregroundColor: Colors.white, backgroundColor: Colors.blue.shade700,
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 170),
//                       SizedBox(
//                         width: 200,
//                         child: ElevatedButton.icon(
//                           onPressed: () {
//                             _showLogoutDialog(context);
//                           },
//                           icon: Icon(Icons.logout),
//                           label: Text('Log out'),
//                           style: ElevatedButton.styleFrom(
//                             foregroundColor: Colors.black, backgroundColor: Colors.grey.shade300,
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 50),
//                       ElevatedButton(
//                         onPressed: () {
//                           _showDeveloperDialog(context);
//                         },
//                         child: Text('Know the Developer'),
//                         style: ElevatedButton.styleFrom(
//                           foregroundColor: Colors.white, backgroundColor: Colors.blue.shade700,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   void _showLogoutDialog(BuildContext context) {
//     AuthService authService = AuthService();
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Logout'),
//           content: Text('Are you sure you want to log out?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child: Text('No'),
//             ),
//             TextButton(
//               onPressed: () {
//                 authService.logout();
//                 Navigator.of(context).pop(); // Close the dialog
//                 Get.offAll(LoginScreen()); // Navigate to login screen and clear previous routes
//               },
//               child: Text('Yes'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void _showDeveloperDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Know the Developer'),
//           content: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 _buildDeveloperInfo(
//                   context,
//                   'assets/images/developerImage/frontendDeveloper.jpg',
//                   'Frontend Developer',
//                   'Rahul Bera',
//                 ),
//                 SizedBox(height: 16),
//                 _buildDeveloperInfo(
//                   context,
//                   'assets/images/developerImage/backenddeveloper.jpg',
//                   'Backend Developer',
//                   'Arpan Duari',
//                 ),
//                 SizedBox(height: 16),
//                 _buildDeveloperInfo(
//                   context,
//                   'assets/images/developerImage/uiuxDesginer.jpeg',
//                   'UI/UX Designer',
//                   'Tusar Mondal',
//                 ),
//                 SizedBox(height: 16),
//                 _buildDeveloperInfo(
//                   context,
//                   'assets/images/developerImage/sovan.jpeg',
//                   'Data Entry',
//                   'Sovan Samanta',
//                 ),
//               ],
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child: Text('Close'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   Widget _buildDeveloperInfo(BuildContext context, String imagePath, String role, String name) {
//     return Row(
//       children: [
//         CircleAvatar(
//           radius: 30,
//           backgroundImage: AssetImage(imagePath), // Replace with developer's image path
//         ),
//         SizedBox(width: 16),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               role,
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Text(name),
//           ],
//         ),
//       ],
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../view_model/services/HomeTabService/homeTabController.dart';
import '../../../../../view_model/services/Login_Services/Login_Helper_Function/LoginAuthServices.dart';
import '../../../../../view_model/services/Login_Services/Login_Helper_Function/Login_Storage_Helper.dart';
import '../../../Login/Login_View.dart'; // Import your HomeController

class ProfileScreen extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    String? name = LoginStorageHelper.retrieveName();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Container(
                decoration: BoxDecoration(
                  gradient: controller.getBackgroundGradient(), // Use gradient from HomeController
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/defaultimage/defaultprofile.png'), // Replace with your asset image path
                      ),
                      SizedBox(height: 24),
                      Text(
                        name ?? 'No Name Available', // Display the retrieved name
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text('Dept : BCA'),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Get.snackbar("Edit Profile Screen", "This Screen Available on Next update");
                            },
                            child: Text('Edit Profile'),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black, backgroundColor: Colors.grey.shade300,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Get.snackbar("Settings Screen", "This Screen Available in Next update");
                            },
                            child: Text('Settings'),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white, backgroundColor: Colors.blue.shade700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 170),
                      SizedBox(
                        width: 200,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            _showLogoutDialog(context);
                          },
                          icon: Icon(Icons.logout),
                          label: Text('Log out'),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black, backgroundColor: Colors.grey.shade300,
                          ),
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
    );
  }

  void _showLogoutDialog(BuildContext context) {
    AuthService authService = AuthService();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                authService.logout();
                Navigator.of(context).pop(); // Close the dialog
                Get.offAll(LoginScreen()); // Navigate to login screen and clear previous routes
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}

// import 'package:attendence/view/Screens/Login/Login_View.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class ProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile Section'),
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       extendBodyBehindAppBar: true,
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Colors.blue.shade900,
//               Colors.blue.shade300,
//             ],
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.only(top: 100),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               CircleAvatar(
//                 radius: 50,
//                 backgroundImage: AssetImage('assets/avatar.jpg'), // Replace with your asset image path
//               ),
//               SizedBox(height: 24),
//               Text(
//                 'Mr. Surjya Kanta Ghosh',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 8),
//               Text('Joined in 2017 | Dept : BCA'),
//               SizedBox(height: 50),
//               ElevatedButton(
//                 onPressed: () {
//                   _showDeveloperDialog(context);
//                 },
//                 child: Text('Know the Developer'),
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.white, backgroundColor: Colors.blue.shade700,
//                 ),
//               ),
//               SizedBox(height: 50),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       // Handle edit profile button pressed
//                     },
//                     child: Text('Edit Profile'),
//                     style: ElevatedButton.styleFrom(
//                       foregroundColor: Colors.black, backgroundColor: Colors.grey.shade300,
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Handle settings button pressed
//                     },
//                     child: Text('Settings'),
//                     style: ElevatedButton.styleFrom(
//                       foregroundColor: Colors.white, backgroundColor: Colors.blue.shade700,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 100),
//               SizedBox(
//                 width: 200,
//                 child: ElevatedButton.icon(
//                   onPressed: () {
//                     _showLogoutDialog(context);
//                   },
//                   icon: Icon(Icons.logout),
//                   label: Text('Log out'),
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: Colors.black, backgroundColor: Colors.grey.shade300,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _showLogoutDialog(BuildContext context) {
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
//                 Navigator.of(context).pop(); // Close the dialog
//                 Get.to(LoginScreen()); // Navigate to login screen
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
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               _buildDeveloperInfo(
//                 context,
//                 'assets/images/developerImage/frontendDeveloper.jpg',
//                 'Frontend Developer',
//                 'Rahul Bera',
//               ),
//               SizedBox(height: 16),
//               _buildDeveloperInfo(
//                 context,
//                 'assets/images/developerImage/backenddeveloper.jpg',
//                 'Backend Developer',
//                 'Arpan Duari',
//               ),
//               SizedBox(height: 16),
//               _buildDeveloperInfo(
//                 context,
//                 'assets/images/developerImage/uiuxDesginer.jpeg',
//                 'UI/UX Designer',
//                 'Tusar Mondal',
//               ),
//             ],
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





import 'package:attendence/view/Screens/Login/Login_View.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../view_model/services/Login_Services/Login_Helper_Function/Login_Storage_Helper.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    String? name = LoginStorageHelper.retrieveName();
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Section'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade900,
              Colors.blue.shade300,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/avatar.jpg'), // Replace with your asset image path
              ),
              SizedBox(height: 24),
              Text(
                name ?? 'No Name Available', // Display the retrieved name
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Joined in 2017 | Dept : BCA'),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  _showDeveloperDialog(context);
                },
                child: Text('Know the Developer'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue.shade700,
                ),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle edit profile button pressed
                    },
                    child: Text('Edit Profile'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black, backgroundColor: Colors.grey.shade300,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle settings button pressed
                    },
                    child: Text('Settings'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.blue.shade700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 100),
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
    );
  }

  void _showLogoutDialog(BuildContext context) {
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

  void _showDeveloperDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Know the Developer'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDeveloperInfo(
                context,
                'assets/images/developerImage/frontendDeveloper.jpg',
                'Frontend Developer',
                'Rahul Bera',
              ),
              SizedBox(height: 16),
              _buildDeveloperInfo(
                context,
                'assets/images/developerImage/backenddeveloper.jpg',
                'Backend Developer',
                'Arpan Duari',
              ),
              SizedBox(height: 16),
              _buildDeveloperInfo(
                context,
                'assets/images/developerImage/uiuxDesginer.jpeg',
                'UI/UX Designer',
                'Tusar Mondal',
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDeveloperInfo(BuildContext context, String imagePath, String role, String name) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(imagePath), // Replace with developer's image path
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              role,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(name),
          ],
        ),
      ],
    );
  }
}

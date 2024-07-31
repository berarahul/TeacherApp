import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// class ProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile Section'),
//         backgroundColor: Colors.blue,
//         automaticallyImplyLeading: false,
//
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               radius: 50,
//               backgroundImage: AssetImage('assets/avatar.jpg'), // Replace with your asset image path
//             ),
//             SizedBox(height: 24),
//             Text(
//               'Mr. Surjya Kanta Ghosh',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             Text('Joined in 2017 | Dept : BCA'),
//             SizedBox(height: 150),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle edit profile button pressed
//                   },
//
//                   child: Text('Edit Profile'),
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: Colors.black, backgroundColor: Colors.grey.shade300,
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle settings button pressed
//                   },
//                   child: Text('Settings'),
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: Colors.white, backgroundColor: Colors.blue.shade700,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 150),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton.icon(
//
//                 onPressed: () {
//                   // Handle log out button pressed
//                 },
//                 icon: Icon(Icons.logout),
//                 label: Text('Log out'),
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.white, backgroundColor: Colors.blue,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Section'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent, // Set transparent background for AppBar
        elevation: 0, // Remove AppBar elevation
      ),

      extendBodyBehindAppBar: true, // Extend body behind AppBar
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
                'Mr. Surjya Kanta Ghosh',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Joined in 2017 | Dept : BCA'),
              SizedBox(height: 100),
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
              SizedBox(height: 200),
              SizedBox(
                width: 200,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Handle log out button pressed
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
}

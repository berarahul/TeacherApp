import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Handle more button pressed
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
            SizedBox(height: 24),
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
            SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                // Handle log out button pressed
              },
              icon: Icon(Icons.logout),
              label: Text('Log out'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, backgroundColor: Colors.grey.shade300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../providers/auth_notifier.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // Mengambil data user yang sedang login
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(title:  Text('Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, ${user?.email}',
                style: TextStyle(fontSize: 18)),
            SizedBox(height: screenWidth * 0.05),
            ElevatedButton(
              onPressed: () {
                context.read<AuthNotifier>().signOut();
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../services/auth/auth_services.dart'; // perbaikan: import AuthService
import 'profile_screen.dart';
import 'sign_in_screen.dart'; // perbaikan: nama file sesuai punyamu

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService auth = AuthService();
    return StreamBuilder(
      stream: auth.authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const ProfileScreen();
        } else {
          return SignInScreen();
        }
      },
    );
  }
}
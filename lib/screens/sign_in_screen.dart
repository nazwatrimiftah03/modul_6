import 'package:flutter/material.dart';
import 'package:modul_6/screens/sign_up_screen.dart';
import 'package:modul_6/utils/snackbar_helper.dart';
import 'package:provider/provider.dart';
import '../providers/auth_notifier.dart';

class SignInScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final authNotifier = Provider.of<AuthNotifier>(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sign In',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: screenWidth * 0.05),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: screenWidth * 0.05),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: screenWidth * 0.05),
            ElevatedButton(
              onPressed: authNotifier.isLoading
                  ? null
                  : () async {
                bool success = await authNotifier.signIn(
                  emailController.text,
                  passwordController.text,
                );

                if (!context.mounted) return;

                if (!success) {
                  SnackBarHelper.show(context, 'Email/Password Salah');
                }
              },
              child: authNotifier.isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Login'),
            ),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SignUpScreen()),
              ),
              child: const Text('Belum punya akun? Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
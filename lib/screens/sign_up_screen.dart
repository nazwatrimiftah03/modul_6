import 'package:flutter/material.dart';
import 'package:modul_6/utils/snackbar_helper.dart';
import 'package:provider/provider.dart';
import '../providers/auth_notifier.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignUpScreen({super.key});

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
              'Sign Up',
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
                bool success = await authNotifier.signUp(
                  emailController.text,
                  passwordController.text,
                );

                if (!context.mounted) return;

                if (success) {
                  Navigator.pop(context);
                } else {
                  SnackBarHelper.show(context, 'Gagal Sign Up');
                }
              },
              child: authNotifier.isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Register'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Sudah punya akun? Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
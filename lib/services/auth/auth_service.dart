import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // Singleton Pattern -> hanya 1 objek
  AuthService._internal();
  static final AuthService _instance = AuthService._internal();
  factory AuthService() {
    return _instance;
  }

  // Alias firebase autentikasi
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Status pengguna real time
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Sign Up
  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } catch (e) {
      print("Error Sign Up: $e");
      return null;
    }
  }

  // Sign In
  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } catch (e) {
      print("Error Sign In: $e");
      return null;
    }
  }

  // Sign Out
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
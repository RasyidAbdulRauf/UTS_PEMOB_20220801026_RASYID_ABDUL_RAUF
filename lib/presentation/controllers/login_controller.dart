import 'package:flutter/material.dart';

class LoginController {
  // Method to handle login logic
  Future<bool> login(
      String email, String password, BuildContext context) async {
    await Future.delayed(Duration(seconds: 1)); // Simulating network delay

    if (email == 'user@user.com' && password == 'password') {
      _showLoginSuccessDialog(context);
      await Future.delayed(Duration(seconds: 2));
      return true;
    } else {
      _showLoginFailureDialog(context);
      await Future.delayed(Duration(seconds: 2));
      return false;
    }
  }

  void _showLoginSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login Berhasil'),
          content: Text('Anda berhasil masuk ke aplikasi.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showLoginFailureDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login Gagal'),
          content: Text('Email atau password yang Anda masukkan salah.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

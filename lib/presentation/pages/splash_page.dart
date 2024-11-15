import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Image.asset(
              'assets/images/logo.png', // Sesuaikan path sesuai dengan lokasi gambar
              width: 250, // Atur ukuran gambar
              height: 250,
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import '../controllers/home_controller.dart';

class BasePage extends StatelessWidget {
  final Widget bodyContent;
  final int selectedIndex;
  final HomeController _controller;

  const BasePage({
    super.key,
    required this.bodyContent,
    required this.selectedIndex,
    required HomeController controller,
  }) : _controller = controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Pangan Mart'),
      ),
      body: bodyContent,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        onTap: _controller.onBottomNavTapped,
      ),
    );
  }
}

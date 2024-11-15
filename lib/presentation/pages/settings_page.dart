import 'package:flutter/material.dart';
import 'base_page.dart';
import '../controllers/home_controller.dart';
import 'dart:io';

class SettingsPage extends StatelessWidget {
  final HomeController controller;

  SettingsPage(this.controller);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      bodyContent: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Profile Section
            _buildSectionHeader('Profile'),
            _buildSettingItem(Icons.person, 'Account', () {
              // Navigate to Account settings
            }),
            _buildSettingItem(Icons.lock, 'Change Password', () {
              // Navigate to Change Password
            }),

            // Notification Section
            _buildSectionHeader('Notifications'),
            _buildSettingItem(Icons.notifications, 'Push Notifications', () {
              // Toggle push notifications
            }),
            _buildSettingItem(Icons.email, 'Email Notifications', () {
              // Toggle email notifications
            }),

            // Privacy Section
            _buildSectionHeader('Privacy'),
            _buildSettingItem(Icons.security, 'Privacy Policy', () {
              // Navigate to Privacy Policy
            }),
            _buildSettingItem(Icons.privacy_tip, 'Data Protection', () {
              // Navigate to Data Protection
            }),

            // About Section
            _buildSectionHeader('About'),
            _buildSettingItem(Icons.info, 'About App', () {
              // Navigate to About App
            }),
            _buildSettingItem(Icons.help, 'Help & Support', () {}),

            // Logout Button
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _exitApp(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              child: Text('Exit', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
      selectedIndex: 3,
      controller: controller,
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
        ),
      ),
    );
  }

  Widget _buildSettingItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(title),
      onTap: onTap,
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
    );
  }
}

void _exitApp(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Confirm Exit'),
        content: Text('Apakah anda yakin ingin keluar?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              exit(0);
            },
            child: Text('Exit'),
          ),
        ],
      );
    },
  );
}

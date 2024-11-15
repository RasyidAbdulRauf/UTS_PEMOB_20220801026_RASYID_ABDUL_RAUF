import 'package:flutter/material.dart';
import 'presentation/pages/login_page.dart';
import 'presentation/pages/home_page.dart';
import 'presentation/pages/profile_page.dart';
import 'presentation/pages/settings_page.dart';
import 'presentation/pages/category_page.dart';
import 'presentation/pages/splash_page.dart';
import 'core/navigation/navigation_service.dart';
import 'presentation/controllers/home_controller.dart';
import 'domain/usecases/navigate_to_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize services and controllers
    final navigationService = NavigationService();
    final navigateToPageUseCase = NavigateToPageUseCase(navigationService);
    final homeController = HomeController(navigateToPageUseCase);

    return FutureBuilder(
        future: Future.delayed(Duration(seconds: 3)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashPage();
          } else {
            return MaterialApp(
              navigatorKey: NavigationService.navigatorKey,
              title: 'Pangan Mart',
              debugShowCheckedModeBanner: false,
              initialRoute: '/login',
              routes: {
                '/login': (context) => LoginPage(homeController),
                '/home': (context) => HomePage(homeController),
                '/category': (context) => CategoryPage(homeController),
                '/profile': (context) => ProfilePage(homeController),
                '/settings': (context) => SettingsPage(homeController),
              },
            );
          }
        });
  }
}

import 'package:flutter/material.dart';
import 'presentation/pages/books_page.dart';
import 'presentation/pages/favorite_page.dart';
import 'presentation/pages/settings_page.dart';
import 'core/navigation/navigation_service.dart';
import 'presentation/controllers/home_controller.dart';
import 'domain/usecases/navigate_to_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Inisialisasi layanan navigasi dan kontroler
    final navigationService = NavigationService();
    final navigateToPageUseCase = NavigateToPageUseCase(navigationService);
    final homeController = HomeController(navigateToPageUseCase);

    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey, // Global navigator key
      title: 'Digital E-Library',
      debugShowCheckedModeBanner: false,
      initialRoute: '/books', // Rute awal
      routes: {
        '/books': (context) => BooksPage(homeController),
        '/favorites': (context) => FavoritePage(homeController),
        '/settings': (context) => SettingsPage(homeController),
      },
    );
  }
}
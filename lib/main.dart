import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibank/routes/app_routes.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(const IBankApp());
}

class IBankApp extends StatelessWidget {
  const IBankApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Note: We use MaterialApp.router for GoRouter compatibility
    return MaterialApp.router(
      title: 'iBank',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: AppRouter.router,
      // If you need GetX for dependency injection:
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: child, // This allows GetX features inside GoRouter
        );
      },
    );
  }
}

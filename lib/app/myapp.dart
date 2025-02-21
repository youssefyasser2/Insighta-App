import 'package:flutter/material.dart';
import 'package:insighta/app/navigation/app_router.dart';

/// Root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Insighta',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      themeMode: ThemeMode.light,
      routerConfig: appRouter,  // استخدام GoRouter
    );
  }
}

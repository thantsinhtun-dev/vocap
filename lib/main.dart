import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocap/src/core/app_themes.dart';
import 'package:vocap/src/presentation/splash/splash_screen.dart';
import 'package:vocap/src/routes/app_route.dart';


void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      darkTheme: AppThemes.darkTheme,
      theme: AppThemes.lightTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: goRouter,
    );
  }
}

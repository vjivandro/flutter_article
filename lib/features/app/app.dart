import 'package:articleapp/features/app/routes.dart';
import 'package:articleapp/features/app/themes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: AppThemes.themeData,
      routerConfig: AppRouter().generateRoute(),
    );
  }
}
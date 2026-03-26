import 'package:flutter/material.dart';

import '../features/splash/presentation/splash_page.dart';
import 'theme/app_theme.dart';

class Ride4KurdistanApp extends StatelessWidget {
  const Ride4KurdistanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ride4Kurdistan',
      theme: AppTheme.build(),
      home: const SplashPage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movies/core/services/services_loactor.dart';

import 'core/utils/app_string.dart';
import 'movies/presentation/screens/movies_screen.dart';
import 'tv/presentation/screens/tv_screen.dart';

void main() {
  ServicesLoactor().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.appName,
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: Colors.grey.shade900),
      home: const TvScreen(),
    ); 
  }
}

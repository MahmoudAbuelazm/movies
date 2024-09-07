import 'package:flutter/material.dart';
import 'package:movies/core/services/services_loactor.dart';

import 'movies/presentation/screens/movies_screen.dart';

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
      title: 'Movies App',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: Colors.grey.shade900),
      home: const MainMoviesScreen(),
    );
  }
}

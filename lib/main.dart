import 'package:flutter/material.dart';
import 'package:p01_final_project/pages/all_schools_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School Student Population Ranking',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 191, 255)),
        useMaterial3: true,
      ),
      home: const AllSchoolsPage(),
    );
  }
}
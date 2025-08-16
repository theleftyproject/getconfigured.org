import 'package:flutter/material.dart';
import 'package:lefty_framework_website/pages/home_page.dart' show HomePage;

void main() => runApp(const LamentApp());

class LamentApp extends StatelessWidget {
  const LamentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LAMENT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.deepPurple[700],
        textTheme: ThemeData.light().textTheme.apply(fontFamily: 'Inter'),
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.deepPurple[300],
        textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'Inter'),
      ),
      themeMode: ThemeMode.system, // respects browser color scheme
      home: const HomePage(),
    );
  }
}


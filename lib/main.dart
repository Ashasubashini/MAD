import 'package:flutter/material.dart';
import 'package:week2/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;  // Keep track of whether dark mode is enabled

  // Function to toggle the theme mode
  void _toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;  // Switch between light and dark mode
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Queens',
      theme: ThemeData.light(),  // Light theme
      darkTheme: ThemeData.dark(),  // Dark theme
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,  // Switch between themes based on isDarkMode
      initialRoute: '/',  // Initial route set to home page
      routes: {
        '/': (context) => HomePage(toggleTheme: _toggleTheme, isDarkMode: isDarkMode),  // Pass toggleTheme function to HomePage
      },
    );
  }
}

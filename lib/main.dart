import 'package:flutter/material.dart';
import 'package:week2/Home.dart';
import 'package:week2/cart.dart';
import 'package:week2/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Queens',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(toggleTheme: _toggleTheme, isDarkMode: isDarkMode),
        '/buying' : (context) => const Cart(),
        '/profile' : (context) => const Profile(),
      },
    );
  }
}

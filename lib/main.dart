import 'package:flutter/material.dart';
import 'package:week2/Home.dart';
import 'package:week2/battery_screen.dart';
import 'package:week2/camera_screen.dart';
import 'package:week2/cart.dart';
import 'package:week2/const.dart';
import 'package:week2/profile.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_stripe/flutter_stripe.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MyApp());
}

Future<void> setup() async {
  Stripe.publishableKey = stripePublishableKey;

  // Initialize secure storage (if needed)
  const FlutterSecureStorage storage = FlutterSecureStorage();
  await storage.containsKey(key: 'userToken');
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
        '/': (context) =>
            HomePage(toggleTheme: _toggleTheme, isDarkMode: isDarkMode),
        '/buying': (context) => CartPage(),
        '/profile': (context) => ProfilePage(),
        '/battery': (context) => BatteryScreen(), // Battery status page
        '/camera': (context) => CameraScreen(),
// Added Camera Screen route
      },
    );
  }
}

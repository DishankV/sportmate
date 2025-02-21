// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ui/screens/welcome_screen.dart'; // Import your WelcomeScreen
import 'ui/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure binding is initialized
  final isFirstRun = await _checkFirstRun(); // Check if it's the first run
  runApp(MyApp(isFirstRun: isFirstRun));
}

Future<bool> _checkFirstRun() async {
  final prefs = await SharedPreferences.getInstance();
  // Check if the app has been launched before
  bool isFirstRun = prefs.getBool('isFirstRun') ?? true;
  if (isFirstRun) {
    // Set the flag to false for future launches
    await prefs.setBool('isFirstRun', false);
  }
  return isFirstRun;
}

class MyApp extends StatelessWidget {
  final bool isFirstRun;

  const MyApp({required this.isFirstRun});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SportsMate App',
      theme: ThemeData(primarySwatch: Colors.red),
      debugShowCheckedModeBanner: false, // Remove the debug banner
      home:
          isFirstRun
              ? WelcomeScreen()
              : LoginPage(), // Show WelcomeScreen or LoginScreen
    );
  }
}

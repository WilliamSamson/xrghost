import 'package:flutter/material.dart';
import 'package:xrghost/Interface/home.dart';
import 'package:xrghost/core/imports.dart';
import 'core/app/routes.dart';
import 'core/app/theme.dart';
import 'core/firebase/firebase_options.dart';
import 'core/utils/responsive.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase using firebase_options.dart
  await _initializeFirebase();

  // Run the app
  runApp(const XRGhostApp());
}

Future<void> _initializeFirebase() async {
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform, // Use auto-generated options
    );
  } catch (e) {
    debugPrint("Firebase initialization failed: $e");
  }
}

class XRGhostApp extends StatelessWidget {
  const XRGhostApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XRGhost',
      debugShowCheckedModeBanner: false,

      // Light Theme
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ),

      // Dark Theme
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[900],
        textTheme: const TextTheme(
          headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.white70),
        ),
      ),

      // Default to light theme
      themeMode: ThemeMode.light,

      // Home Screen
      home: const HomePage(),
    );
  }
}
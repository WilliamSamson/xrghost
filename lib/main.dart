import 'package:flutter/material.dart';
import 'package:xrghost/core/imports.dart';
import 'core/app/routes.dart';
import 'core/app/theme.dart';
import 'core/utils/responsive.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase and error handling
  await _initializeFirebase();

  // Run app with Riverpod + Router
  runApp(
    ProviderScope(
      child: XRGhostApp(),
    ),
  );
}

Future<void> _initializeFirebase() async {
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    debugPrint("Firebase initialization failed: $e");
  }
}

class XRGhostApp extends HookWidget {
  XRGhostApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = useMemoized(() => AppRouter().router);
    final theme = useThemeController(); // Riverpod hook

    return MaterialApp.router(
      title: 'XRGhost',
      debugShowCheckedModeBanner: false,

      // Dynamic Theme
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: theme.isDarkMode ? ThemeMode.dark : ThemeMode.light,

      // Advanced Routing (go_router)
      routerConfig: router,

      // Responsive Design Baseline
      builder: (context, child) {
        ScreenMetrics.init(context); // Set responsive breakpoints
        return ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          ],
        );
      },
    );
  }
}

// Riverpod controller for theme state
final themeController = StateNotifierProvider<ThemeController, bool>((ref) {
  return ThemeController();
});

class ThemeController extends StateNotifier<bool> {
  ThemeController() : super(false);

  void toggleTheme() => state = !state;
  bool get isDarkMode => state;
}
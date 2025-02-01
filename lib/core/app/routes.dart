import 'package:flutter/material.dart';
import 'package:xrghost/Interface/home.dart';
import 'package:xrghost/Interface/management/errorpage.dart';
import 'package:xrghost/core/imports.dart';

class AppRouter {
  late final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => CustomTransitionPage(
          child: const HomePage(),
          transitionsBuilder: (_, animation, __, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      ),
      // Add other routes (About, Projects)
    ],
    errorBuilder: (_, state) => ErrorPage(error: state.error),

  );
}
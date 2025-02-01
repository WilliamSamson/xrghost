import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final dynamic error;

  const ErrorPage({super.key, this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 64,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(height: 20),
              Text(
                'Oops! Something went wrong',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
              const SizedBox(height: 10),
              if (error != null)
                Text(
                  _getErrorMessage(error!),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                icon: const Icon(Icons.home),
                label: const Text('Return Home'),
                onPressed: () => _navigateHome(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getErrorMessage(dynamic error) {
    if (error is FlutterError) {
      return error.toStringShort();
    }
    return error.toString();
  }

  void _navigateHome(BuildContext context) {
    // Use go_router's context.go() if using named routes
    // context.go('/');

    // Or use Navigator if using basic routing
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      Navigator.pushReplacementNamed(context, '/');
    }
  }
}
import 'package:flutter/material.dart';
import 'package:grid_wars/home/home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                const Text('Loading...'),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const HomePage()),
                    );
                  },
                  child: const Text('home'),
                ),
                // TODO Add loading bar.
              ],
            ),
          ),
        ],
      ),
    );
  }
}

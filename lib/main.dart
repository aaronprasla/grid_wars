import 'package:flutter/material.dart';
import 'package:grid_wars/game/game.dart';
import 'package:grid_wars/home/home.dart';
import 'package:grid_wars/splash/splash.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const SplashScreen(),
        '/home': (BuildContext context) =>  const HomePage(),
        '/game': (BuildContext context) =>  const GamePage()
      },
    );
  }
}

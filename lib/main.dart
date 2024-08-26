import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grid_wars/bloc/game/game_bloc.dart';
import 'package:grid_wars/bloc/player/player_bloc.dart';
import 'package:grid_wars/bloc/round/round_bloc.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<GameBloc>(create: (context) => GameBloc()),
        BlocProvider<RoundBloc>(create: (context) => RoundBloc()),
        BlocProvider<PlayerBloc>(create: (context) => PlayerBloc()),
      ],
      child: MaterialApp(
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => const SplashScreen(),
          '/home': (BuildContext context) => const HomePage(),
          '/game': (BuildContext context) => const GamePage()
        },
      ),
    );
  }
}

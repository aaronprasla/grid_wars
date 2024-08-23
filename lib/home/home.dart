import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grid_wars/bloc/game/game_bloc.dart';
import 'package:grid_wars/bloc/player/player_bloc.dart';
import 'package:grid_wars/bloc/round/round_bloc.dart';
import 'package:grid_wars/home/home_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GameBloc>(create: (context) => GameBloc()),
        BlocProvider<RoundBloc>(create: (context) => RoundBloc()),
        BlocProvider<PlayerBloc>(create: (context) => PlayerBloc()),
      ],
      child: const Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}

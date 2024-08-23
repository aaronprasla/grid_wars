import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grid_wars/bloc/game/game_bloc.dart';
import 'package:grid_wars/bloc/round/round_bloc.dart';
import 'package:grid_wars/game/game_screen.dart';


class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GameBloc()),
        BlocProvider(create: (_) => RoundBloc()),
      ],
      child: const GameScreen(),
    );
  }
}

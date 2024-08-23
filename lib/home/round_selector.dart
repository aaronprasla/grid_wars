import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grid_wars/bloc/round/round_bloc.dart';
import 'package:grid_wars/bloc/round/round_event.dart';
import 'package:grid_wars/bloc/round/round_state.dart';

class RoundSelector extends StatelessWidget {
  const RoundSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Number of Rounds'),
        BlocBuilder<RoundBloc, RoundState>(
          builder: (context, state) {
            int rounds = state is NumberOfRoundsState ? state.maxRounds : 0;

            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    if (rounds > 1) {
                      BlocProvider.of<RoundBloc>(context).add(
                        UpdateNumberOfRoundsEvent(1, rounds - 1, rounds - 1, 1),
                      );
                    }
                  },
                  iconSize: 150.0,
                  icon: const Icon(
                    Icons.arrow_left_rounded,
                    color: Colors.black,
                  ),
                ),
                Text('$rounds'),
                IconButton(
                  onPressed: () {
                    BlocProvider.of<RoundBloc>(context).add(
                      UpdateNumberOfRoundsEvent(1, rounds + 1, rounds + 1, 1),
                    );
                  },
                  iconSize: 150.0,
                  icon: const Icon(
                    Icons.arrow_right_rounded,
                    color: Colors.black,
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

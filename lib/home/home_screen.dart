import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:grid_wars/bloc/player/player_bloc.dart';
import 'package:grid_wars/bloc/player/player_event.dart';
import 'package:grid_wars/bloc/player/player_state.dart';
import 'package:grid_wars/game/game.dart';
import 'package:grid_wars/home/player_input.dart';
import 'package:grid_wars/home/round_selector.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _player1Controller;
  late TextEditingController _player2Controller;

  @override
  void initState() {
    super.initState();
    _player1Controller = TextEditingController();
    _player2Controller = TextEditingController();
  }

  @override
  void dispose() {
    _player1Controller.dispose();
    _player2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: BlocBuilder<PlayerBloc, PlayerState>(
                            builder: (context, state) {
                              if (state is PlayerNamesState) {
                                _player1Controller.text = state.player1;
                                _player1Controller.selection =
                                    TextSelection.fromPosition(TextPosition(
                                        offset:
                                            _player1Controller.text.length));
                              }
                              return Column(
                                children: [
                                  PlayerInput(
                                    hintText: 'Player 1',
                                    controller: _player1Controller,
                                    onChanged: (value) {
                                      final player2 =
                                          (state is PlayerNamesState)
                                              ? state.player2
                                              : '';
                                      BlocProvider.of<PlayerBloc>(context).add(
                                          UpdatePlayerNamesEvent(
                                              value, player2));
                                    },
                                    icon: Icons.edit,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      BlocProvider.of<PlayerBloc>(context).add(
                                          UpdatePlayerMarkerEvent(
                                              state is PlayerMarkersState
                                                  ? (state.mark == 0 ? 1 : 0)
                                                  : 1));
                                    },
                                    child: Icon(
                                      state is PlayerMarkersState &&
                                              state.mark == 0
                                          ? Icons.close
                                          : Icons.circle_outlined,
                                      color: state is PlayerMarkersState &&
                                              state.mark == 0
                                          ? Colors.red
                                          : Colors.blue,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        const Spacer(),
                        Expanded(
                          child: BlocBuilder<PlayerBloc, PlayerState>(
                            builder: (context, state) {
                              if (state is PlayerNamesState) {
                                _player2Controller.text = state.player2;
                                _player2Controller.selection =
                                    TextSelection.fromPosition(TextPosition(
                                        offset:
                                            _player2Controller.text.length));
                              }
                              return Column(
                                children: [
                                  PlayerInput(
                                    hintText: 'Player 2',
                                    controller: _player2Controller,
                                    onChanged: (value) {
                                      final player1 =
                                          (state is PlayerNamesState)
                                              ? state.player1
                                              : '';
                                      BlocProvider.of<PlayerBloc>(context).add(
                                          UpdatePlayerNamesEvent(
                                              player1, value));
                                    },
                                    icon: Icons.edit,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      BlocProvider.of<PlayerBloc>(context).add(
                                          UpdatePlayerMarkerEvent(
                                              state is PlayerMarkersState
                                                  ? (state.mark == 0 ? 1 : 0)
                                                  : 1));
                                    },
                                    child: Icon(
                                      state is PlayerMarkersState &&
                                              state.mark == 0
                                          ? Icons.circle_outlined
                                          : Icons.close,
                                      color: state is PlayerMarkersState &&
                                              state.mark == 0
                                          ? Colors.blue
                                          : Colors.red,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const RoundSelector(),
                    const SizedBox(height: 16),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey,
                        padding: const EdgeInsets.all(7.0),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const GamePage(),
                          ),
                        );
                      },
                      child: const Text(
                        "PLAY",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey,
                        padding: const EdgeInsets.all(7.0),
                      ),
                      child: const Text(
                        "CONTINUE",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => Dialog(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text('This is a typical dialog.'),
                                const SizedBox(height: 15),
                                Row(
                                  children: [
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(
                                        Icons.check,
                                        color: Color.fromARGB(
                                            255, 115, 255, 0),
                                      ),
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(
                                        Icons.close_rounded,
                                        color: Color.fromARGB(
                                            255, 255, 0, 0),
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

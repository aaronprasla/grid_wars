import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grid_wars/bloc/game/game_bloc.dart';
import 'package:grid_wars/bloc/game/game_event.dart';
import 'package:grid_wars/bloc/game/game_state.dart';
import 'package:grid_wars/bloc/round/round_bloc.dart';
import 'package:grid_wars/bloc/round/round_state.dart';
import 'package:grid_wars/game/player_info_row.dart';
import 'package:grid_wars/home/home.dart';

import 'line_painter.dart';


class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  GameScreenState createState() => GameScreenState();
}

class GameScreenState extends State<GameScreen> with SingleTickerProviderStateMixin {
  bool _isXTurn = true;
  List<int>? _winningCombo;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleTap(int index) {
    if (_animationController.isAnimating) {
      _animationController.stop();
    }

    final gameBloc = context.read<GameBloc>();
    final boardState = gameBloc.state is BoardState
        ? gameBloc.state as BoardState
        : BoardState(
            currentBoard: List.filled(9, ''),
          );

    if (boardState.currentBoard[index] == '' && _winningCombo == null) {
      final updatedBoard = List<String>.from(boardState.currentBoard);
      updatedBoard[index] = _isXTurn ? 'X' : 'O';

      gameBloc.add(UpdateBoardEvent(updatedBoard));

      final combo = _checkWinner(updatedBoard, _isXTurn ? 'X' : 'O');
      if (combo != null) {
        setState(() {
          _winningCombo = combo;
          _animationController.reset();
          _animationController.forward();
        });
      } else if (_isBoardFull(updatedBoard)) {
        _showDrawDialog();
      }

      setState(() {
        _isXTurn = !_isXTurn;
      });
    }
  }

  List<int>? _checkWinner(List<String> board, String player) {
    const List<List<int>> winningCombinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6],
    ];

    for (var combo in winningCombinations) {
      if (board[combo[0]] == player &&
          board[combo[1]] == player &&
          board[combo[2]] == player) {
        return combo;
      }
    }

    return null;
  }

  bool _isBoardFull(List<String> board) {
    return !board.contains('');
  }

  void _showDrawDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('It\'s a Draw!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Play Again'),
          ),
        ],
      ),
    );
  }

  Widget _buildTile(int index) {
    return GestureDetector(
      onTap: () => _handleTap(index),
      child: BlocBuilder<GameBloc, GameState>(
        builder: (context, state) {
          final boardState = state is BoardState ? state.currentBoard : List.filled(9, '');

          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Center(
              child: Text(
                boardState[index],
                style: TextStyle(
                  fontSize: 95.0,
                  fontWeight: FontWeight.bold,
                  color: boardState[index] == 'X'
                      ? Colors.redAccent[700]
                      : Colors.blueAccent[700],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 35.0),
        child: Column(
          children: [
            _buildTopRow(context),
            PlayerInfoRow(),
            _buildBoard(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopRow(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => _showExitDialog(context),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: BlocBuilder<RoundBloc, RoundState>(
            builder: (context, state) {
              return Text(
                'Round ${state is NumberOfRoundsState ? state.currentRound : '1'}/${state is NumberOfRoundsState ? state.maxRounds : '10'}',
              );
            },
          ),
        ),
      ],
    );
  }

  void _showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Return to Main Menu?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Save & Exit'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
            child: const Text("Exit"),
          ),
        ],
      ),
    );
  }

  Widget _buildBoard() {
    return Expanded(
      child: Center(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 0.0,
                        mainAxisSpacing: 0.0,
                      ),
                      itemBuilder: (context, index) => _buildTile(index),
                      itemCount: 9,
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
            if (_winningCombo != null)
              CustomPaint(
                size: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.width),
                painter: LinePainter(_winningCombo!, _animationController, _isXTurn),
              ),
          ],
        ),
      ),
    );
  }
}

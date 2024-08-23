import 'package:equatable/equatable.dart';

class BoardState extends GameState {
  final List<String> currentBoard;

  const BoardState({required this.currentBoard});
  @override
  List<Object?> get props => [currentBoard];
}

class SavedBoardState extends GameState {
  final List<String> savedBoard;
  const SavedBoardState({required this.savedBoard});
  @override
  List<Object?> get props => [savedBoard];
}

class ScoreState extends GameState {
  final int currentScore;

  const ScoreState({required this.currentScore});
  @override
  List<Object?> get props => [currentScore];
}

class SavedScoreState extends GameState {
  final int savedScore;

  const SavedScoreState({required this.savedScore});
  List<Object?> get props => [savedScore];
}

abstract class GameState extends Equatable {
  const GameState([List props = const []]) : super();
}

class GameStateUninitialized extends GameState {
  const GameStateUninitialized();
  @override
  List<Object?> get props => [];
}

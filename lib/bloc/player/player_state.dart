import 'package:equatable/equatable.dart';

abstract class PlayerState extends Equatable {
  const PlayerState([List props = const []]) : super();
}

class PlayerNamesState extends PlayerState {
  final String player1;
  final String player2;
  const PlayerNamesState({required this.player1, required this.player2});
  @override
  List<Object?> get props => [player1, player2];
}

class PlayerMarkersState extends PlayerState {
  final int mark;
  const PlayerMarkersState({required this.mark});
  @override
  List<Object?> get props => [mark];
}

class PlayerIDState extends PlayerState {
  final String player1ID;
  final String player2ID;

  const PlayerIDState({required this.player1ID, required this.player2ID});
  @override
  List<Object?> get props => [player1ID, player1ID];
}

class PlayerStateUninitialized extends PlayerState {
  const PlayerStateUninitialized();
  @override
  List<Object?> get props => [];
}

import 'package:equatable/equatable.dart';

abstract class RoundState extends Equatable {
  const RoundState([List props = const []]) : super();
}

class NumberOfRoundsState extends RoundState {
  final int currentRound;
  final int savedRound;
  final int maxRounds;
  final int maxSavedRound;

  const NumberOfRoundsState({required this.currentRound, required this.maxRounds, required this.maxSavedRound, required this.savedRound});
  @override
  List<Object?> get props => [currentRound, savedRound, maxRounds, maxSavedRound];
}

class RoundStateUninitialized extends RoundState {
  const RoundStateUninitialized();
  @override
  List<Object?> get props => [];
}
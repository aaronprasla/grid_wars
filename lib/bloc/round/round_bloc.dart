import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grid_wars/bloc/round/round_event.dart';
import 'package:grid_wars/bloc/round/round_state.dart';

class RoundBloc extends Bloc<RoundEvent, RoundState> {
  RoundBloc() : super(const RoundStateUninitialized()) {
    on<UpdateNumberOfRoundsEvent>((event, emit) {
        emit(NumberOfRoundsState(
            currentRound: event.currentRound,
            savedRound: event.savedRound,
            maxRounds: event.maxRound,
            maxSavedRound: event.maxSavedRound));
    });
  }
}

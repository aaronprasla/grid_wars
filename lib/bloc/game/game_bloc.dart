import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grid_wars/bloc/game/game_event.dart';
import 'package:grid_wars/bloc/game/game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(const GameStateUninitialized()) {
    

    on<UpdateBoardEvent>((event, emit) {
      emit(BoardState(
          currentBoard: event.currentBoard));
    });

    on<UpdateScoreEvent>((event, emit) {
      emit(ScoreState(
          currentScore: event.currentScore));
    });

    
  }
}


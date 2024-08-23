import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grid_wars/bloc/player/player_event.dart';
import 'package:grid_wars/bloc/player/player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  PlayerBloc() : super(const PlayerStateUninitialized()) {
    on<UpdatePlayerNamesEvent>((event, emit) {
      emit(PlayerNamesState(player1: event.player1, player2: event.player2));
    });
    on<UpdatePlayerMarkerEvent>((event, emit) {
      print("UpdatePlayerMarkerEvent caught with player: ${event.marker}");
      final state = this.state;
      print(state);

      if (state is PlayerStateUninitialized) {
        // Initialize the state with a PlayerMarkersState object
        emit(const PlayerMarkersState(mark: 0));
      } else if (state is PlayerMarkersState) {
        print(state.mark);
        int markVal = state.mark;

        if (event.marker == 0) {
          markVal = markVal == 0 ? 1 : 0;
        } else if (event.marker == 1) {
          markVal = markVal == 1 ? 0 : 1;
        }

        emit(PlayerMarkersState(
          mark: markVal,
        ));
      }
    });
  }
}

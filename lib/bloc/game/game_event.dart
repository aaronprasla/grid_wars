abstract class GameEvent {}

class UpdateBoardEvent extends GameEvent {
  final List<String> currentBoard;

  UpdateBoardEvent(this.currentBoard);
}

class UpdateSavedBoardEvent extends GameEvent {
  final List<String> savedBoard;
  
  UpdateSavedBoardEvent(this.savedBoard);
}

class UpdateScoreEvent extends GameEvent {
  final int currentScore;

  UpdateScoreEvent(this.currentScore);
}

class UpdateSavedScoreEvent extends GameEvent {
  final int savedScore;

  UpdateSavedScoreEvent(this.savedScore);
}

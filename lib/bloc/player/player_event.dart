abstract class PlayerEvent {}

class UpdatePlayerNamesEvent extends PlayerEvent {
  final String player1;
  final String player2;

  UpdatePlayerNamesEvent(this.player1, this.player2);
}


class UpdatePlayerMarkerEvent extends PlayerEvent {
  final int marker; // 'X' or 'O'

  UpdatePlayerMarkerEvent(this.marker);
}

class UpdatePlayerID extends PlayerEvent {
  final String player1ID;
  final String player2ID;

  UpdatePlayerID(this.player1ID, this.player2ID);
}
abstract class RoundEvent {}

class UpdateNumberOfRoundsEvent extends RoundEvent {
  final int currentRound;
  final int savedRound;
  final int maxRound;
  final int maxSavedRound;

  UpdateNumberOfRoundsEvent(this.currentRound, this.savedRound, this.maxRound, this.maxSavedRound);
}
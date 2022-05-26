import 'time.dart' as time;

/// Calculate the angle between hands
double calculateAngleBetweenClock(time.Time time) {
  /// A 24 hour hand turns 360 degrees in 24 hours or 1440 minute, or 0.25 degrees per minutes (how a 12 hour hand, it would be 0.5 degrees per minute)
  /// A minute hand turns 360 degrees in 60 minutes, or 6 degrees per minute
  ///
  /// Ah = 0.25 * h + M
  /// where Ah = angle in degrees of the hour hand measured clockwise from the 12
  /// Am = 6 * M
  /// where Am = angle in degrees of the minute hand measured clockwise from the 12

  // find Ah
  double aH = 0.25 * (60 * time.hours + time.minutes);

  // find Am
  int aM = 6 * time.minutes;

  // find the angle in between the hour and minute hands
  return (aH - aM).abs();
}

import 'package:clock_angle_calculator/time.dart';
import 'time.dart' as time;
import 'constants.dart';

/// ValidateUserInput validates the input taken from the user as [String] and returns if the input is valid or not
class ValidateUserInput {
  final String? userInput;
  ValidateUserInput(this.userInput);

  /// Checks for simple [String] issues
  /// Returns [null] is the input is fine
  /// Returns the error [String] is the input has a problem
  String? get validateForGenericInputErrors {
    if (userInput == null || userInput!.isEmpty) {
      return Constants.nothingEntered;
    } else if (userInput!.contains(":") == false) {
      return Constants.incorrectTimeSyntax;
    } else if (int.tryParse(userInput!.substring(0, userInput!.indexOf(":"))) ==
            null ||
        int.tryParse(userInput!.substring(userInput!.indexOf(":") + 1)) ==
            null) {
      return Constants.incorrectTimeIntSyntax;
    } else if (int.parse(userInput!.substring(0, userInput!.indexOf(":"))) >
        23) {
      return Constants.incorrectTimeHourSyntax;
    } else if (int.parse(userInput!.substring(userInput!.indexOf(":") + 1)) >
        59) {
      return Constants.incorrectTimeMinSyntax;
    } else if (int.parse(userInput!.substring(0, userInput!.indexOf(":"))) <
            0 ||
        int.parse(userInput!.substring(userInput!.indexOf(":") + 1)) < 0) {
      return Constants.incorrectTimeNegativeSyntax;
    } else {
      return null;
    }
  }

  /// Converts the given validated String into [Time]
  /// [time]: String that represents a valid time in the form of hh:mm
  time.Time get convertToTime => time.Time(
        int.parse(userInput!.substring(0, userInput!.indexOf(":"))),
        int.parse(userInput!.substring(userInput!.indexOf(":") + 1)),
      );
}

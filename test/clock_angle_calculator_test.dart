import 'package:clock_angle_calculator/clock_angle_calculator.dart';
import 'package:clock_angle_calculator/constants.dart';
import 'package:clock_angle_calculator/input_validator.dart';
import 'package:clock_angle_calculator/time.dart' as time;
import 'package:test/test.dart';

void main() {
  /// Test the input validator
  test('Testing Input Validation', () {
    // Test for blank
    expect(
      ValidateUserInput(null).validateForGenericInputErrors,
      Constants.nothingEntered,
    );

    // Test for empty String
    expect(
      ValidateUserInput("").validateForGenericInputErrors,
      Constants.nothingEntered,
    );

    // Test for illegal int input
    expect(
      ValidateUserInput("1234").validateForGenericInputErrors,
      Constants.incorrectTimeSyntax,
    );

    // Test for illegal String input
    expect(
      ValidateUserInput("this is not a time").validateForGenericInputErrors,
      Constants.incorrectTimeSyntax,
    );
    expect(
      ValidateUserInput("mm:hh").validateForGenericInputErrors,
      Constants.incorrectTimeIntSyntax,
    );

    // Test for illegal time input
    expect(
      ValidateUserInput("26:15").validateForGenericInputErrors,
      Constants.incorrectTimeHourSyntax,
    );
    expect(
      ValidateUserInput("10:70").validateForGenericInputErrors,
      Constants.incorrectTimeMinSyntax,
    );
    expect(
      ValidateUserInput("-10:00").validateForGenericInputErrors,
      Constants.incorrectTimeNegativeSyntax,
    );

    // Test for valid time input
    expect(
      ValidateUserInput("10:30").validateForGenericInputErrors,
      null,
    );
  });

  /// Test the input validator
  test('Calculating the time', () {
    // Test for valid time input
    expect(
      calculateAngleBetweenClock(time.Time(00, 00)),
      00,
    );
    expect(
      calculateAngleBetweenClock(time.Time(12, 00)),
      180,
    );
    expect(
      calculateAngleBetweenClock(time.Time(24, 00)),
      360,
    );
    expect(
      calculateAngleBetweenClock(time.Time(2, 20)),
      85,
    );
  });
}

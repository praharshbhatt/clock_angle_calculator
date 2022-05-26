/// Needed system libraries
import 'dart:convert';
import 'dart:io';

import 'package:clock_angle_calculator/clock_angle_calculator.dart';
import 'package:clock_angle_calculator/input_validator.dart';

// This is the starting point of our application
void main(List<String> arguments) {
  /// Welcome message
  print(
    '''
Hello, welcome to the clock angle calculator in Dart by Praharsh. (◕‿◕✿)
    ''',
  );

  bool restart = true;

  while (restart) {
    restart = false;

    /// Print welcome message and further instruction to the user
    print(
      '''

  Please enter the time in the format of HH:MM to calculate the time
  in between the hour hand and the minute hand of the 24-hour clock.
      
      ''',
    );

    /// Take inputs form the user and validate the input for syntax discrepancies
    ValidateUserInput vui = ValidateUserInput(stdin.readLineSync(
      encoding: utf8,
    ));
    if (vui.validateForGenericInputErrors != null) {
      print(vui.validateForGenericInputErrors);
      restart = true;
    }

    // Only continue if the input does not have any error
    if (!restart) {
      // Calculate the angle
      print(
        'The angle between the hour and minute hand is: ${calculateAngleBetweenClock(vui.convertToTime)}',
      );
    }
  }

  /// End of the program
  print(
    '''

  Thanks for using me!
  Find more open source stuff at my github profile: https://github.com/praharshbhatt/
      
      ''',
  );
}

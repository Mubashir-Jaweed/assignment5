import 'dart:io';
import 'dart:convert';

void app() {
  File currentUserFile = File('./DB/currentUser.json');
  String currentUserString = currentUserFile.readAsStringSync();
  Map currentUser = json.decode(currentUserString);
  print('\n');
  print('Welcome ${currentUser['email']}');
  print('Welcome To App');
}

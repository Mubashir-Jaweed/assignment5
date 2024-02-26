import 'dart:io';
import 'data.dart';
import 'dart:convert';

void app() {

    Data api = Data();

  File currentUserFile = File('./DB/currentUser.json');
  String currentUserString = currentUserFile.readAsStringSync();
  List currentUser = json.decode(currentUserString);
  print('\n');
  print('Welcome To App');
  
  api.getCities();
  print('');
  api.getArea();


  
}





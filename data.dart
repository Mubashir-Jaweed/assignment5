import 'dart:io';
import 'dart:convert';

class Data {
  addUser(newUserData) {
    File userFile = File('./DB/users.json');
    String userString = userFile.readAsStringSync();
    List<dynamic> users = json.decode(userString);
    users.add(newUserData);
    String updatedData = json.encode(users);
    userFile.writeAsStringSync(updatedData);
    print('\n');
    print('User Successfully Created');
    print('\n');
  }

  readUser(email, pass) {
    File userFile = File('./DB/users.json');
    String userString = userFile.readAsStringSync();
    List<dynamic> users = json.decode(userString);

    if (users.any((element) => element['email'] == email)) {
      File currentUserFile = File('./DB/currentUser.json');
      String currentUserString = currentUserFile.readAsStringSync();
      Map currentUser = json.decode(currentUserString);
      currentUser['email'] = email;
      currentUser['pass'] = pass;
      String updateCurrentUserString = json.encode(currentUser);
      currentUserFile.writeAsStringSync(updateCurrentUserString);
      print(updateCurrentUserString);
      return true;
    } else {
      return false;
    }
  }
}

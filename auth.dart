import 'dart:io';
import 'data.dart';
import 'app.dart';

void auth() {
  handleAuthOption();
}

class Auth {
  Data api = Data();

  login() {
    print('.. Login .. ');
    var [email, pass] = getEmailAndPassword();

    if (api.readUser(email, pass)) {
      app();
    } else {
      login();
    }
  }

  SignUp() {
    print('\n');
    print('Select account Type');
    print("");

    String accType = handleSignUpOption();
    var [email, pass] = getEmailAndPassword();

    Map createNewUser = {
      'accType': accType,
      'email': email,
      "pass": pass,
    };
    api.addUser(createNewUser);
    login();
  }
}

void handleAuthOption() {
  Auth authentication = Auth();

  bool isSelectAuth = true;
  while (isSelectAuth) {
    print("1. for Login");
    print("2. for Sign Up");
    var selectAuth = stdin.readLineSync();

    if (selectAuth == '1') {
      authentication.login();
      isSelectAuth = false;
      break;
    } else if (selectAuth == '2') {
      authentication.SignUp();
      isSelectAuth = false;
      break;
    } else {
      print('\n');
      print("Please select correct option");
      print('\n');
    }
  }
}

handleSignUpOption() {
  print('1. for : SignUp as Admin');
  print('2. for : SignUp as User');
  bool isSelectedSignUpOption = true;
  while (isSelectedSignUpOption) {
    var accType = stdin.readLineSync();

    if (accType == '1') {
      isSelectedSignUpOption = false;
      return 'rider';
    } else if (accType == '2') {
      isSelectedSignUpOption = false;
      return 'personal';
    } else {
      print('\n');
      print("Please select correct option");
      print('\n');
    }
  }
}

getEmailAndPassword() {
  print('Enter Your Email');
  var email = stdin.readLineSync();
  print('Enter Your Password');
  var pass = stdin.readLineSync();

  if (email!.isEmpty || pass!.isEmpty) {
    print('Please enter valid email & Password');
    getEmailAndPassword();
  } else {
    return ([email, pass]);
  }
}

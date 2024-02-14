import 'dart:io';
import 'dart:convert';

void auth() {
  handleAuthOption();
}

class Auth {
  login() {
    print('Login Classs Fun');
  }

  SignUp() {
    print('\n');
    print('Select account Type');
    print("");
    print('1. for : Login as Rider');
    print('2. for : Login as User');

    String accType = handleSignUpOption();
    var [email ,pass] = getEmailAndPassword();
    
    Map createNewUser = {
      'accType':accType,
      'email':email,
      "password":pass,
    };

    File('./DB/data.json').writeAsStringSync(json.encode(createNewUser));
    
    print([accType,email,pass]);
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
    return([email, pass]);
  }
}

import 'dart:io';
import 'dart:convert';
import 'dart:math';

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

    if (users.any(
        (element) => element['email'] == email && element['pass'] == pass)) {
      File currentUserFile = File('./DB/currentUser.json');
      String currentUserString = currentUserFile.readAsStringSync();
      List currentUser =
          users.where((element) => element['email'] == email).toList();
      String updateCurrentUserString = json.encode(currentUser);
      currentUserFile.writeAsStringSync(updateCurrentUserString);
      print("\n");
      print("Welcome ${currentUser[0]["email"]}");
      print("Account Type : ${currentUser[0]["accType"]}");

      return true;
    } else {
      return false;
    }
  }

  getCities() {
    List cities = [
      {
        'city': 'New York',
        'locations': [
          {'name': 'Brooklyn'},
          {'name': 'Manhattan'},
          {'name': 'Queens'},
          {'name': 'Bronx'},
          {'name': 'Staten Island'}
        ]
      },
      {
        'city': 'London',
        'locations': [
          {'name': 'Westminster'},
          {'name': 'Camden'},
          {'name': 'Greenwich'},
          {'name': 'Kensington'},
          {'name': 'Islington'}
        ]
      },
      {
        'city': 'Tokyo',
        'locations': [
          {'name': 'Shinjuku'},
          {'name': 'Shibuya'},
          {'name': 'Ginza'},
          {'name': 'Asakusa'},
          {'name': 'Harajuku'}
        ]
      },
      {
        'city': 'Paris',
        'locations': [
          {'name': 'Montmartre'},
          {'name': 'Le Marais'},
          {'name': 'Latin Quarter'},
          {'name': 'Champs-Elysées'},
          {'name': 'Saint-Germain-des-Prés'}
        ]
      },
      {
        'city': 'Sydney',
        'locations': [
          {'name': 'Bondi Beach'},
          {'name': 'Sydney Opera House'},
          {'name': 'Darling Harbour'},
          {'name': 'The Rocks'},
          {'name': 'Circular Quay'}
        ]
      },
      {
        'city': 'Rome',
        'locations': [
          {'name': 'Colosseum'},
          {'name': 'Vatican City'},
          {'name': 'Trevi Fountain'},
          {'name': 'Pantheon'},
          {'name': 'Roman Forum'}
        ]
      },
      {
        'city': 'Rio de Janeiro',
        'locations': [
          {'name': 'Copacabana Beach'},
          {'name': 'Sugarloaf Mountain'},
          {'name': 'Christ the Redeemer'},
          {'name': 'Ipanema Beach'},
          {'name': 'Tijuca National Park'}
        ]
      }
    ];
    print('Now select Your destination below');
    print('');
    cities.asMap().forEach((index, city) {
      return print('$index for ${city["city"]}');
    });
  }

  getArea() {

    var random = Random();
    int randomInt = random.nextInt(50);
    int price = random.nextInt(100);

    List cities = [
      {
        'city': 'New York',
        'locations': [
          {'name': 'Brooklyn'},
          {'name': 'Manhattan'},
          {'name': 'Queens'},
          {'name': 'Bronx'},
          {'name': 'Staten Island'}
        ]
      },
      {
        'city': 'London',
        'locations': [
          {'name': 'Westminster'},
          {'name': 'Camden'},
          {'name': 'Greenwich'},
          {'name': 'Kensington'},
          {'name': 'Islington'}
        ]
      },
      {
        'city': 'Tokyo',
        'locations': [
          {'name': 'Shinjuku'},
          {'name': 'Shibuya'},
          {'name': 'Ginza'},
          {'name': 'Asakusa'},
          {'name': 'Harajuku'}
        ]
      },
      {
        'city': 'Paris',
        'locations': [
          {'name': 'Montmartre'},
          {'name': 'Le Marais'},
          {'name': 'Latin Quarter'},
          {'name': 'Champs-Elysées'},
          {'name': 'Saint-Germain-des-Prés'}
        ]
      },
      {
        'city': 'Sydney',
        'locations': [
          {'name': 'Bondi Beach'},
          {'name': 'Sydney Opera House'},
          {'name': 'Darling Harbour'},
          {'name': 'The Rocks'},
          {'name': 'Circular Quay'}
        ]
      },
      {
        'city': 'Rome',
        'locations': [
          {'name': 'Colosseum'},
          {'name': 'Vatican City'},
          {'name': 'Trevi Fountain'},
          {'name': 'Pantheon'},
          {'name': 'Roman Forum'}
        ]
      },
      {
        'city': 'Rio de Janeiro',
        'locations': [
          {'name': 'Copacabana Beach'},
          {'name': 'Sugarloaf Mountain'},
          {'name': 'Christ the Redeemer'},
          {'name': 'Ipanema Beach'},
          {'name': 'Tijuca National Park'}
        ]
      }
    ];
    var cityOption = stdin.readLineSync();

    if (int.parse(cityOption!) < cities.length) {
          print('Now select Area below');

      List areas = cities[int.parse(cityOption)]["locations"];

      areas.asMap().forEach((index, area) {
         return print('$index for ${area["name"]}');
      });

        var areaOption = stdin.readLineSync();
        if(int.parse(areaOption!) < areas.length) {
          print('Your Destination Start From : "Current Location" to "${cities[int.parse(cityOption)]["city"]}-${cities[int.parse(cityOption)]["locations"][int.parse(areaOption)]['name']}"');
          print("Time required : $randomInt minutes");
          print("price: $price \$");
          print('\n');
        } else {
        getArea();
      }

    } else {
      getArea();
    }
  }

  selectArea(){

  }
}

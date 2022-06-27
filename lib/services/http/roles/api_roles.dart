import 'package:kla_prototype/model/role.dart';
import 'package:kla_prototype/services/http/http.dart';

const List<String> roleNames = [
  "Farmer",
  "Retail",
  "Transport",
  "Household",
  "Game dev"
];

class ApiRoles extends Http {
  Future<List<Role>> fetchRoles(int numberOfRoles) {
    return Future.delayed(Duration(seconds: 2, milliseconds: 500), () {
      List<Role> roles = [];
      for (int i = 0; i < numberOfRoles; ++i) {
        roles.add(Role(roleNames[i % roleNames.length]));
      }
      return roles;
    });
  }
}

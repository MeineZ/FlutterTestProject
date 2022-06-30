import 'package:equatable/equatable.dart';

class Role {
  final String title;

  Role(this.title);
}

class RoleView extends Equatable {
  @override
  List<Object?> get props => [title.toLowerCase()];

  late String title;

  RoleView(this.title);
  
  RoleView.fromRole(Role role) {
    title = role.title;
  }
}
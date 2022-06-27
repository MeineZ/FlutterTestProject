part of 'roles_bloc.dart';

@immutable
abstract class RolesState extends Equatable {
  const RolesState();

  @override
  List<Object> get props => [];
}

class RolesInitial extends RolesState {}

class RolesLoaded extends RolesState {
  @override
  List<Object> get props => [roles];

  final List<RoleView> roles;

  RolesLoaded(this.roles) : super();
}

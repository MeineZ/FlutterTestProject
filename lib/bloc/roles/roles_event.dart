part of 'roles_bloc.dart';

@immutable
abstract class RolesEvent extends Equatable {
  @override
  List<Object?> get props;

  const RolesEvent();
}

class GetRoles extends RolesEvent {
  @override
  List<Object?> get props => [numberOfRoles];

  final int numberOfRoles;

  const GetRoles(this.numberOfRoles);
}

import 'package:bloc/bloc.dart';
import 'package:kla_prototype/model/role.dart';
import 'package:kla_prototype/services/http/roles/api_roles.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'roles_event.dart';
part 'roles_state.dart';

class RolesBloc extends Bloc<RolesEvent, RolesState> {
  ApiRoles rolesApi;

  RolesBloc(this.rolesApi) : super(RolesInitial()) {
    on<RolesEvent>((event, emit) async {
      if (event is GetRoles) {
        final List<Role> roles = await rolesApi.fetchRoles(event.numberOfRoles);
        emit(RolesLoaded(roles.map((role) => RoleView.fromRole(role)).toList()));
      }
    });
  }
}

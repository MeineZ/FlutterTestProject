import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

import 'package:kla_prototype/bloc/roles/roles_bloc.dart';
import 'package:kla_prototype/model/role.dart';
import 'package:kla_prototype/services/http/roles/api_roles.dart';
import 'package:mocktail/mocktail.dart';

class MockRolesBloc extends MockBloc<RolesEvent, RolesState>
    implements RolesBloc {
    }

class MockApiRoles extends Mock implements ApiRoles { }

void main() { 
  late RolesBloc rolesBloc;
  late ApiRoles rolesApi;

  setUp(() {
    rolesApi = ApiRoles();
    rolesBloc = RolesBloc(rolesApi);

    when(() => rolesApi.fetchRoles(1)).thenAnswer(
      (invocation) async => <Role>[
        Role("farmer"),
      ],
    );
},);

  group('Mock the role bloc', () {
      blocTest<RolesBloc, RolesState>(
        'emits [] when nothing is loaded',
        build: () => rolesBloc,
        expect: () => const <RolesState>[],
      );

      blocTest<RolesBloc, RolesState>(
        'emits loaded state when fetching roles',
        build: () => rolesBloc,
        act: (RolesBloc bloc) { bloc.add(GetRoles(1)); },
        wait: const Duration(seconds: 5),
        expect: () => const <RolesState>[],
      );
  },);
}
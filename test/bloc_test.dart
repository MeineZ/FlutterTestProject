import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

import 'package:kla_prototype/bloc/roles/roles_bloc.dart';
import 'package:kla_prototype/model/role.dart';
import 'package:kla_prototype/services/http/roles/api_roles.dart';
import 'package:mocktail/mocktail.dart';

class MockRolesBloc extends MockBloc<RolesEvent, RolesState>
    implements RolesBloc {}

class MockApiRoles extends Mock implements ApiRoles {}

void main() {
  late RolesBloc sut;
  late MockApiRoles rolesApi;

  setUp(
    () {
      rolesApi = MockApiRoles();
      sut = RolesBloc(rolesApi);

      when(() => rolesApi.fetchRoles(1)).thenAnswer(
        (invocation) async => <Role>[
          Role("farmer"),
        ],
      );
    },
  );

  tearDown(() {
    sut.close();
  });

  test(
    'RoleView\'s are the same',
    () {
      expect(RoleView("farmer"), RoleView("farmer"));
    },
  );

  group(
    'Mock the role bloc',
    () {
      blocTest<RolesBloc, RolesState>(
        'emits [] when nothing is loaded',
        build: () => sut,
        expect: () => const <RolesState>[],
      );

      blocTest<RolesBloc, RolesState>(
        'emits loaded state when fetched roles',
        build: () => sut,
        act: (RolesBloc bloc) {
          bloc.add(GetRoles(1));
        },
        wait: const Duration(seconds: 5),
        expect: () => [isA<RolesLoaded>()],
      );

      blocTest<RolesBloc, RolesState>(
        'emits loaded state with correct output when fetched roles',
        build: () => sut,
        act: (RolesBloc bloc) {
          bloc.add(GetRoles(1));
        },
        wait: const Duration(seconds: 5),
        expect: () {
          verify(() => rolesApi.fetchRoles(1)).called(1);

          return [
            RolesLoaded([RoleView("farmer")])
          ];
        },
      );
    },
  );
}

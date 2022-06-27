import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:kla_prototype/model/role.dart';
import 'package:kla_prototype/services/http/roles/api_roles.dart';
import 'package:kla_prototype/services/navigation/navigation.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationInitial()) {
    on<NavigationEvent>((event, emit) async {
      if(event is NavigateToEvent) {
        if(event.clean) {
          Navigation.openScreenClean(event.buildContext, event.destinationScreen);
        }
        else {
          Navigation.openScreen(event.buildContext, event.destinationScreen);
        }
      }
      else if(event is NavigateBackEvent) {
        Navigation.back(event.buildContext);
      }
    });
  }
}

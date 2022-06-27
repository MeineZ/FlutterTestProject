part of 'navigation_bloc.dart';

@immutable
abstract class NavigationEvent extends Equatable {
  @override
  List<Object?> get props;

  const NavigationEvent();
}

class NavigateToEvent extends NavigationEvent {
  @override
  List<Object?> get props => [destinationScreen, clean];

  final Widget destinationScreen;
  final BuildContext buildContext;

  final bool clean;

  const NavigateToEvent(this.buildContext, this.destinationScreen, {this.clean = false, });
}

class NavigateBackEvent extends NavigationEvent {
  @override
  List<Object?> get props => [];

  final BuildContext buildContext;

  const NavigateBackEvent(this.buildContext);
}
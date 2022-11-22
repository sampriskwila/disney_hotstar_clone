part of 'bottom_navbar_bloc.dart';

abstract class BottomNavbarEvent extends Equatable {
  const BottomNavbarEvent();

  @override
  List<Object> get props => [];
}

class ChangeBottomNavbarEvent extends BottomNavbarEvent {
  final int index;

  const ChangeBottomNavbarEvent(this.index);

  @override
  List<Object> get props => [index];
}

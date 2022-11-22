import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navbar_event.dart';
part 'bottom_navbar_state.dart';

class BottomNavbarBloc extends Bloc<BottomNavbarEvent, BottomNavbarState> {
  int currentIndex = 0;

  BottomNavbarBloc() : super(BottomNavbarHome()) {
    on<ChangeBottomNavbarEvent>((event, emit) {
      currentIndex = event.index;

      switch (currentIndex) {
        case 0:
          emit(BottomNavbarHome());
          break;
        case 1:
          emit(BottomNavbarSeries());
          break;
        case 2:
          emit(BottomNavbarDisney());
          break;
        case 3:
          emit(BottomNavbarMovie());
          break;
        case 4:
          emit(BottomNavbarLocal());
          break;
      }
    });
  }
}

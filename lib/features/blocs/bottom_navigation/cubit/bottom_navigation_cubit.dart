import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_exchange/domain/constants/enums.dart';

part 'bottom_navigation_state.dart';
part 'bottom_navigation_cubit.freezed.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(const BottomNavigationState.home(NavBarItem.home, 0));

  void getNavBarItem(NavBarItem navbarItem) {
    switch (navbarItem) {
      case NavBarItem.home:
        emit(
          const BottomNavigationState.home(NavBarItem.home, 0),
        );
        break;
      case NavBarItem.userCredentials:
        emit(
          const BottomNavigationState.userCredentials(NavBarItem.userCredentials, 1),
        );
        break;
    }
  }
}

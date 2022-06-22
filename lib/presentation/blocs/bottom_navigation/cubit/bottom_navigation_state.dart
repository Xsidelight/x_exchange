part of 'bottom_navigation_cubit.dart';

@freezed
class BottomNavigationState with _$BottomNavigationState {
  const factory BottomNavigationState.home(NavBarItem navBarItem, int index) = _Home;
  const factory BottomNavigationState.userCredentials(NavBarItem navBarItem, int index) = _UserCredentials;
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../core/services/dependency_injection/injection_container.dart';
import '../../../../core/shared/views/persistent_view.dart';
import '../../../authentication/presentation/bloc/authentication_bloc.dart';
import '../../../authentication/presentation/screens/profile_screen.dart';
import '../../../cart/presentation/screens/cart_screen.dart';
import '../../../history/presentation/screens/history_screen.dart';
import '../../../home/presentation/bloc/home_bloc.dart';
import '../../../home/presentation/screens/home_screen.dart';
import 'bottom_tab_navigator.dart';

class NavigationController extends ChangeNotifier {
  List<int> _indexHistory = [0];

  List<int> get indexHistory => _indexHistory;

  List<Widget> _screens = [];

  List<Widget> get screens => _screens;

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void getScreens(int startIndex) {
    _currentIndex = startIndex;
    _indexHistory = [0];
    _screens = [
      ChangeNotifierProvider(
          create: (_) => BottomTabNavigator(
                TabItem(
                  child: BlocProvider(
                    create: (_) => sl<HomeBloc>(),
                    child: const HomeScreen(),
                  ),
                ),
              ),
          child: const PersistentView()),
      ChangeNotifierProvider(
          create: (_) => BottomTabNavigator(
                TabItem(
                  child: BlocProvider(
                    create: (_) => sl<AuthenticationBloc>(),
                    child: const CartScreen(),
                  ),
                ),
              ),
          child: const PersistentView()),
      ChangeNotifierProvider(
          create: (_) => BottomTabNavigator(
                TabItem(
                  child: BlocProvider(
                    create: (_) => sl<AuthenticationBloc>(),
                    child: const HistoryScreen(),
                  ),
                ),
              ),
          child: const PersistentView()),
      ChangeNotifierProvider(
          create: (_) => BottomTabNavigator(
                TabItem(
                  child: BlocProvider(
                    create: (_) => sl<AuthenticationBloc>(),
                    child: const ProfileScreen(),
                  ),
                ),
              ),
          child: const PersistentView()),
    ];
  }

  void changeIndex(int index) {
    if (index == _currentIndex) return;
    _currentIndex = index;
    _indexHistory.add(index);
    notifyListeners();
  }

  void goBack() {
    if (_indexHistory.length == 1) return;
    _indexHistory.removeLast();
    _currentIndex = _indexHistory.last;
    notifyListeners();
  }

  void backToHome() {
    _currentIndex = 0;
    notifyListeners();
  }

  void resetIndex() {
    _indexHistory = [0];
    _currentIndex = 0;
    notifyListeners();
  }
}

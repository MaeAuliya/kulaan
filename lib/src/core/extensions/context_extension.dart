import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/authentication/presentation/bloc/authentication_bloc.dart';
import '../../features/authentication/presentation/providers/authentication_provider.dart';
import '../../features/authentication/presentation/providers/user_provider.dart';
import '../../features/cart/presentation/bloc/cart_bloc.dart';
import '../../features/cart/presentation/providers/cart_provider.dart';
import '../../features/cart/presentation/providers/map_provider.dart';
import '../../features/home/presentation/bloc/home_bloc.dart';
import '../../features/home/presentation/providers/home_provider.dart';
import '../../features/navigation/presentation/providers/navigation_controller.dart';
import '../shared/theme_provider.dart';

extension ContextExtension on BuildContext {
  // Theme
  ThemeData get theme => Theme.of(this);

  // Responsiveness
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  // Frame width from Figma
  double get _designWidth => 360;

  // Frame height from Figma
  double get _designHeight => 640;

  Size get size => mediaQuery.size;

  double get width => size.width;

  double get height => size.height;

  double get widthScale => width / _designWidth;

  double get heightScale => height / _designHeight;

  double get topSafe => MediaQuery.paddingOf(this).top;

  // Blocs
  AuthenticationBloc get authBloc => read<AuthenticationBloc>();

  HomeBloc get homeBloc => read<HomeBloc>();

  CartBloc get cartBloc => read<CartBloc>();

  // Providers
  AuthenticationProvider get authProvider => read<AuthenticationProvider>();

  UserProvider get userProvider => read<UserProvider>();

  HomeProvider get homeProvider => read<HomeProvider>();

  MapProvider get mapProvider => read<MapProvider>();

  CartProvider get cartProvider => read<CartProvider>();

  ThemeNotifier get themeProvider => read<ThemeNotifier>();

// Navigator
// if you using bottom navigator controller
  NavigationController get bottomNavigator => read<NavigationController>();
}

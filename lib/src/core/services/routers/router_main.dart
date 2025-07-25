part of 'router.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return _pageBuilder(
        (_) => BlocProvider(
          create: (_) => sl<AuthenticationBloc>(),
          child: const SplashScreen(),
        ),
        settings: settings,
      );
    case SignInScreen.routeName:
      return _pageBuilder(
        (_) => BlocProvider(
          create: (_) => sl<AuthenticationBloc>(),
          child: const SignInScreen(),
        ),
        settings: settings,
      );
    case HomeScreen.routeName:
      return _pageBuilder(
        (_) => BlocProvider(
          create: (_) => sl<HomeBloc>(),
          child: const HomeScreen(),
        ),
        settings: settings,
      );
    case DetailSellerScreen.routeName:
      return _pageBuilder(
        (_) => BlocProvider(
          create: (_) => sl<CartBloc>(),
          child: const DetailSellerScreen(),
        ),
        settings: settings,
      );
    case UserBottomNavigationCore.routeName:
      final int index = settings.arguments as int? ?? 0;
      return _pageBuilder(
        (_) => BlocProvider(
          create: (_) => sl<HomeBloc>(),
          child: UserBottomNavigationCore(
            startIndex: index,
          ),
        ),
        settings: settings,
      );
    default:
      return _pageBuilder(
        (_) => const PageUnderConstruction(),
        settings: settings,
      );
  }
}

PageRouteBuilder<dynamic> _pageBuilder(
  Widget Function(BuildContext) page, {
  required RouteSettings? settings,
}) {
  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (context, _, __) => page(context),
    barrierDismissible: false,
  );
}

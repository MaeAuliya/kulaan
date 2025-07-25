import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:nsvilecity/src/core/services/dependency_injection/injection_container.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'src/core/extensions/context_extension.dart';
import 'src/core/res/colours.dart';
import 'src/core/services/routers/router.dart';
import 'src/core/shared/theme_provider.dart';
import 'src/core/utils/constants.dart';
import 'src/features/authentication/presentation/providers/authentication_provider.dart';
import 'src/features/authentication/presentation/providers/user_provider.dart';
import 'src/features/authentication/presentation/screens/splash_screen.dart';
import 'src/features/cart/presentation/providers/cart_provider.dart';
import 'src/features/cart/presentation/providers/map_provider.dart';
import 'src/features/home/presentation/providers/home_provider.dart';
import 'src/features/navigation/presentation/providers/navigation_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Init Mobile Orientations
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Init Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Init Dependencies
  await initialization();

  // MapBoxInit
  MapboxOptions.setAccessToken(Constants.mapAccessToken);

  // runApp(const MyApp());
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => MapProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => NavigationController()),
      ],
      child: MaterialApp(
        title: 'KULAAN',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colours.primaryBlue),
          scaffoldBackgroundColor: Colors.white,
          useMaterial3: true,
          textTheme: const TextTheme(
            headlineSmall: TextStyle(fontSize: 20, color: Colors.black),
            bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          cardColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colours.primaryBlue,
            foregroundColor: Colors.white,
          ),
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colours.primaryBlue,
            brightness: Brightness.dark,
          ),
          scaffoldBackgroundColor: Colors.grey[900],
          useMaterial3: true,
          textTheme: const TextTheme(
            headlineSmall: TextStyle(fontSize: 20, color: Colors.white),
            bodyLarge: TextStyle(fontSize: 16, color: Colors.white70),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          cardColor: Colors.grey[800],
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.grey,
            foregroundColor: Colors.white,
          ),
        ),
        themeMode:
            context.themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        onGenerateRoute: (settings) => generateRoute(settings),
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}

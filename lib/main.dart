import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nsvilecity/src/core/services/dependency_injection/injection_container.dart';
// import 'package:nsvilecity/src/features/home/presentation/screens/splash_screen.dart';
import 'package:nsvilecity/src/features/home/presentation/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'src/core/services/routers/router.dart';
import 'src/features/home/presentation/providers/home_provider.dart';

class ThemeNotifier extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Init Dependencies
  await initialization();

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
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      // child: MaterialApp(
      //   title: 'LBS',
      //   theme: ThemeData(
      //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //     scaffoldBackgroundColor: Colors.white,
      //     useMaterial3: true,
      //   ),
      //   onGenerateRoute: (settings) => generateRoute(settings),
      //   debugShowCheckedModeBanner: false,
      //   // initialRoute: SplashScreen.routeName,
      //   initialRoute: HomeScreen.routeName,
      // ),
      child: MaterialApp(
        title: 'LBS',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          scaffoldBackgroundColor: Colors.white,
          useMaterial3: true,
          textTheme: const TextTheme(
            headlineSmall: TextStyle(fontSize: 20, color: Colors.black),
            bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          cardColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
          ),
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
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
        themeMode: themeNotifier.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        onGenerateRoute: (settings) => generateRoute(settings),
        debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.routeName,
      ),
    );
  }
}

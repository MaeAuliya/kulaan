import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nsvilecity/src/core/services/dependency_injection/injection_container.dart';
// import 'package:nsvilecity/src/features/home/presentation/screens/splash_screen.dart';
import 'package:nsvilecity/src/features/home/presentation/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'src/core/services/routers/router.dart';
import 'src/features/home/presentation/providers/home_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Init Dependencies
  await initialization();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: MaterialApp(
        title: 'LBS',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          scaffoldBackgroundColor: Colors.white,
          useMaterial3: true,
        ),
        onGenerateRoute: (settings) => generateRoute(settings),
        debugShowCheckedModeBanner: false,
        // initialRoute: SplashScreen.routeName,
        initialRoute: HomeScreen.routeName,
      ),
    );
  }
}
